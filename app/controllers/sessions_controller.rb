class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user.nil?
      flash.now[:error] = "Incorrect username and/or password"
      render :new
    else
      login_user!(user)
      flash[:seccess] = "Successfully logged in"
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    flash[:success] = "Successfully logged out"
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end

end

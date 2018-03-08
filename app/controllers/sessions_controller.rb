class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user.nil?
      flash.now[:errors] = "Incorrect email/password"
      render :new
    else

      redirect_to user_url(user)
    end
  end

  def destroy
    current_user = nil
    session[:session_token] = nil
    user.reset_session_token!
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end

end

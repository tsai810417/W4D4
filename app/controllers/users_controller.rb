class UsersController < ApplicationController
  def create
    @user = User.new(user_param)
    if @user.save!
      login_user!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_message
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end


end

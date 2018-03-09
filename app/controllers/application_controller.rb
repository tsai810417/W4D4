class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    return nil if session[:session_token].nil?

    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!@current_user
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    @current_user = nil
    session[:session_token] = nil
  end
end

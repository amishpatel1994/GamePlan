class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user

  def authenticate
    redirect_to :root unless current_user.present? || Rails.env.development?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

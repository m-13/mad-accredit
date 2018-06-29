class ApplicationController < ActionController::Base

  before_action :authenticate!

  def authenticate!
    redirect_to login_path and return unless current_user.present?
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user])
  end

  def after_login_path
    root_path
  end

  def after_logout_path
    login_path
  end
end

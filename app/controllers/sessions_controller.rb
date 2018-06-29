# TODO: extract this to MADapp Login rails engine
class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    result = User::Authentication.call(session_params)
    if result.success?
      session[:user] = result.data.id
      flash[:info] = "Welcome #{current_user.name}!"
      redirect_to after_login_path
    else
      flash[:error] = result.message
      redirect_to login_path
    end
  end

  def destroy
    session[:user] = nil
    redirect_to after_logout_path
  end

  private 

  def session_params
    params.require(:user).permit(:email, :password)
  end
end


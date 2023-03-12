class ApplicationController < ActionController::Base
  protected

  def authenticate
    if current_user.nil?
      flash[:danger] = 'Please log in.'

      redirect_to login_url
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end

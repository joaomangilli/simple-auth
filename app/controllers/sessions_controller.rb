class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.by_username_or_email(session_params[:username]).last
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id

      redirect_to vehicles_url
    else
      flash[:danger] = 'Incorrect credentials. Try again.'

      redirect_to login_url
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to login_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end

class Api::AuthenticationController < Api::MainController
  def create
    user = User.by_username_or_email(login_params[:username]).last
    if user && user.authenticated?(login_params[:password])
      token = JsonWebToken.encode(user_id: user.id)

      render json: {
        token: token
      }
    else
      render json: {}, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end

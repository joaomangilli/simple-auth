class Api::MainController < ActionController::Base
  protect_from_forgery with: :null_session

  protected

  def authenticate
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {}, status: :unauthorized
    end
  end
end

# https://www.bluebash.co/blog/rails-6-7-api-authentication-with-jwt

class Api::HousesController < Api::MainController
  before_action :authenticate, only: :index

  def index
    render json: {
      current_user: @current_user.name
    }
  end
end

# https://dev.to/k_penguin_sato/rails-implement-session-based-authentication-from-scratch-2631

# Pros: strong (sensitive information is heavily hidden)
# Cons: hard to implement and maintain (security issues)

class VehiclesController < ApplicationController
  before_action :authenticate, only: :index

  def index
  end
end

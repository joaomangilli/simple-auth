# https://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html

# Pros: easy to configure and use
# Cons: weak (username and password are sent in each request)

class PeopleController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_USER'], password: ENV['HTTP_BASIC_PASSWORD'], only: :index

  # has authentication
  def index
  end

  # does not have authentication
  def show
  end
end

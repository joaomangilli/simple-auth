Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # BASIC AUTH
  resources :people, only: [:index, :show]

  # SESSION AUTH
  resources :vehicles, only: :index

  namespace :api do
    post '/login', to: 'authentication#create'

    # JWT AUTH
    resources :houses, only: :index
  end
end

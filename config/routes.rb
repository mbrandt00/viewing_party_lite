# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/users/:id/discover', to: 'users#discover'
  post '/users/:id/movies', to: 'movies#index'
  resources :users do
    resources :movies, only: [:index, :show]
  end
end

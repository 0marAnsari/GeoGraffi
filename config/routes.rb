Rails.application.routes.draw do
  get 'home/index'
  root 'home#index' # Home page

  # User authentication
  resources :users, only: [:new, :create, :show, :edit, :update]
  get '/signup', to: 'users#new', as: 'signup'
  
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Graffiti entries
  resources :entries

  get '/api/entries', to: 'entries#json_index', as: 'api_entries'


end

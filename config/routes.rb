Rails.application.routes.draw do
  # resources :tasks, only: [:create, :index, :show, :update, :destroy]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  
  concern :api_base do
    resources :users, only: [:create, :show, :index] do
      resources :tasks
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end

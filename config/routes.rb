Rails.application.routes.draw do
  # resources :tasks, only: [:create, :index, :show, :update, :destroy]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  
  resources :users do
    resources :tasks
  end
end

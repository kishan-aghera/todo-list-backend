Rails.application.routes.draw do
  resources :tasks, only: [:create, :index, :update, :destroy]
end

Rails.application.routes.draw do
  resources :tasks, only: [:create, :index, :show, :update, :destroy]
end

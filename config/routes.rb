Rails.application.routes.draw do
  # resources :tasks, only: [:create, :index, :show, :update, :destroy]
  concern :api_base do
    resources :tasks
  end

  namespace :v1 do
    concerns :api_base
  end
end

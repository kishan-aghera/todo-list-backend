Rails.application.routes.draw do
  # resources :tasks, only: [:create, :index, :show, :update, :destroy]
  concern :api_base do
    resources :users, only: [:create, :show, :index] do
      resources :tasks
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end

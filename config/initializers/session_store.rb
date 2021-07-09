if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_todo-list-rails-api', domain: 'https://kishan-aghera.github.io/todo-list-frontend'
else
  Rails.application.config.session_store :cookie_store, key: '_todo-list-backend' 
end

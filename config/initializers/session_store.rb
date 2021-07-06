if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_todo-list-backend', domain: 'https://todo-list-rails-api.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_todo-list-backend' 
end

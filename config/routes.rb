Rails.application.routes.draw do
  # Auth
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/histories/:id', :to=> 'user#show'
  get '/histories', :to=> 'user#index'

  post '/histories', :to=> 'plugin#create'
  delete '/histories/:id', :to=> 'plugin#destroy'
end

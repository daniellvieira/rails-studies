Rails.application.routes.draw do
  resources :posts
  resources :clients

  post 'search', to: 'search#index'

  root "posts#index"
end

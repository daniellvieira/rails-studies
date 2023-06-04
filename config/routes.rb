Rails.application.routes.draw do
  resources :users
  resources :posts do
    member do
      get :send_alert
    end
  end
  resources :clients

  post 'search', to: 'search#index'

  root "posts#index"
end

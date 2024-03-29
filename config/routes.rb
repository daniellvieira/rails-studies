Rails.application.routes.draw do
  get 'pages/home'
  resources :users
  resources :posts do
    member do
      get :send_alert
    end
  end
  resources :clients

  post 'search', to: 'search#index'

  # Webhooks
  resources :webhooks, only: %i(create index show destroy)
  post 'webhooks/:source', to: 'webhooks#create'

  root "pages#home"
end

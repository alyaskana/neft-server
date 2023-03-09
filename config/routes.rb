require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    resources :sessions, only: %i[create destroy]
    resources :users do
      collection do
        get :current
      end
    end

    resources :games, only: [] do
      collection do
        get :state
        post :buy_seed
      end
    end
  end
end

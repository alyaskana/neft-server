Rails.application.routes.draw do
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
  end
end

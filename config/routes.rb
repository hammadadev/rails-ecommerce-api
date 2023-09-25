Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'registrations#signup'
      post '/login', to: 'registrations#login'
      resources :products, only: [:index, :create, :show, :update, :destroy]
    end
  end
end

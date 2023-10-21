Rails.application.routes.draw do
   mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# config/routes.rb
  namespace :api do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :shopping_lists, only: [:index, :show, :create, :update, :destroy]
  end
  get "/api/shopping_lists/:user_id", to: "shopping_lists#show"
  # Defines the root path route ("/")
  # root "articles#index"
end

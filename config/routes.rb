Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# config/routes.rb
  namespace :api do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :shopping_lists, only: [:index, :show, :create, :update, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

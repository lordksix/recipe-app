Rails.application.routes.draw do
  get 'public_recipes/index'
  root 'foods#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  # Defines the root path route ("/")
  # root "articles#index"
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :create,:edit, :update, :destroy]
  resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
end

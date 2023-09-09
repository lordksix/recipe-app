Rails.application.routes.draw do
  root 'foods#index'

  # devise_for :users

  resources :foods
  resources :recipes
  resources :recipe_foods
  resources :public_recipes, only: [:index]
  resources :recipe_foods, only: [:destroy]

  get '/shoppings/:id', to: 'shoppings#show', as: 'shoppings'

end

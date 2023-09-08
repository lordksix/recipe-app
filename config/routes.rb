Rails.application.routes.draw do
  root 'foods#index'

  devise_for :users

  resources :foods
  resources :recipes
  resources :recipe_foods
  resources :public_recipes, only: [:index]
  resources :recipe_foods, only: [:destroy]
  

  delete '/recipe_foods/:id', to: 'recipes#destroy_recipe_food', as: 'destroy_recipe_food'
end

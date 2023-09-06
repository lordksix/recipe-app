class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
    @current_user = current_user
  end

  def show
    @recipe = Recipe.find_by(id: params['id'])
  end

  def destroy
    @recipe = Recipe.find_by(id: params['id'])
    authorize! :destroy, @recipe
    @recipe.destroy
    redirect_to '/index'
  end
end

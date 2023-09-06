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
    @current_user = current_user
    @current_user.recipes.destroy(params[:id])
    redirect_to '/recipes'
  end

  def new
    @recipe = Recipe.new
    @current_user = current_user
  end

  
end

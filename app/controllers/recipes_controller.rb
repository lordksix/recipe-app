class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]
  authorize_resource only: [:show]

  def index
    @recipes = current_user.recipes
    @current_user = current_user
  end

  def show
    @recipe_foods = @recipe.recipe_foods
    @current_user = current_user
  end

  def destroy
    @recipe.destroy
    redirect_to '/recipes'
  end

  def new
    @recipe = Recipe.new
    @current_user = current_user
    @recipe.recipe_foods.build
    @foods_map = @current_user.foods.all.collect { |food| [food.name, food.id] }
  end

  def destroy_recipe_food
    recipe_food = RecipeFood.find(params[:id])
    recipe = recipe_food.recipe
    recipe_food.destroy
    redirect_to recipe_path(recipe), notice: 'Ingredient was successfully destroyed.'
  end

  def create
    new_recipe = Recipe.new(recipe_params)
    new_recipe.user = current_user
    if new_recipe.save
      flash[:sucess] = 'Recipe saved successfully'
      redirect_to '/recipes'
    else
      flash[:error] = 'Error: Recipe could not be saved'
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
  end

  private

  def find_recipe
    @recipe = Recipe.find_by(id: params['id'])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public,
                                   recipe_foods_attributes: %i[id food_id quantity _destroy])
  end
end

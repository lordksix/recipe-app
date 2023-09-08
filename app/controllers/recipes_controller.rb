class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show destroy edit update]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]
  authorize_resource only: [:show]

  def index
    @recipes = current_user.recipes.includes(:recipe_foods)
    @current_user = current_user
  end

  def show
    @recipe_foods = @recipe.foods.select('recipe_foods.id', 'foods.name', 'recipe_foods.quantity',
                                         'foods.measurement_unit', 'foods.price')
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
    @foods_map = @current_user.foods.pluck(:name, :id)
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

  def edit
    @current_user = current_user
    @foods_map = @current_user.foods.pluck(:name, :id)
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe) }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
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

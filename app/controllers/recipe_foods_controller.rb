class RecipeFoodsController < ApplicationController
  # def index
  #   @recipe_foods = current_user.recipe_foods
  #   @current_user = current_user
  # end

  def create
    recipe = Recipe.find_by(id: params[:recipe_id])
    # Create a new food item with strong parameter handling
    food = Food.new(food_params)
    food.user = current_user

    if food.save
      # Create a RecipeFood record to associate the food with the recipe
      RecipeFood.create(quantity: food.quantity, recipe:, food:)

      flash[:success] = 'Food item created successfully'
      redirect_to recipe_path(recipe)
    else
      flash[:error] = 'Error: Food item could not be created'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
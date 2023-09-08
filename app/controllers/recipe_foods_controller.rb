class RecipeFoodsController < ApplicationController
  def destroy
    @recipe = RecipeFood.find_by(food: Food.find_by(id: params[:id]))
    @recipe.destroy
    redirect_to "/recipes/#{@recipe.recipe.id}"
  end
end

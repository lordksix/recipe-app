class ShoppingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @recipe = Recipe.includes(:foods, :recipe_foods).find(params[:id])
    @ingredients = get_ingredients(@recipe)
    @total_amount = @ingredients.reduce(0) do |acc, item|
      acc + item.price
    end
    @total_item = @ingredients.length
  end

  private

  def get_ingredients(recipe)
    ingredients = recipe.foods.select('foods.id', 'foods.name', 'recipe_foods.quantity',
                                      'foods.measurement_unit', 'foods.price')
    foods = recipe.foods
    ingredients = ingredients.zip(foods)
    ingredients = ingredients.map do |entry|
      Food.new(measurement_unit: entry[1].measurement_unit, name: entry[1].name,
               quantity: entry[1].quantity - entry[0].quantity, price: entry[1].price)
    end
    ingredients = ingredients.select do |ingredient|
      ingredient.quantity.negative?
    end
    ingredients.map do |ingredient|
      ingredient.quantity = ingredient.quantity.abs
      ingredient
    end
  end
end

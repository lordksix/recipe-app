class ShoppingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:id])
    @ingredients = get_ingredients(@recipe)
    @total_amount = @ingredients.reduce(0) do |acc, item|
      acc + item.price
    end
    @total_item = @ingredients.length
  end
end

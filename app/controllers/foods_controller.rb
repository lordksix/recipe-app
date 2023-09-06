class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
    @current_user = current_user
  end

  def create
    new_food = Food.new(food_params)
    new_food.user = current_user
    if new_food.save
      flash[:sucess] = 'Food saved successfully'
      redirect_to '/'
    else
      flash[:error] = 'Error: Food could not be saved'
    end
  end

  def new
    @food = Food.new
    @current_user = current_user
  end

  def destroy
    @current_user = current_user
    @current_user.foods.destroy(params[:id])
    redirect_to '/'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

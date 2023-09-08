class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
    @current_user = current_user
  end

  def create
    new_food = Food.new(food_params)
    new_food.user = current_user
    respond_to do |format|
      if new_food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
        format.json { render :index, status: :created, location: new_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @food = Food.new
    @current_user = current_user
  end

  def destroy
    @current_user = current_user
    @current_user.foods.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

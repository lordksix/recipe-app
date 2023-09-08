require 'rails_helper'

RSpec.describe 'Shoppings', type: :system do
  include Devise::Test::IntegrationHelpers
  before(:all) do
    delete_all
    @john = User.create!(
      email: 'john.doe@mail.com',
      password: 'admin1234'
    )
    @food1 = Food.create(user: @john,
                         name: 'Pizza',
                         measurement_unit: 'Slice',
                         price: 5.03,
                         quantity: 10)
    @food2 = Food.create(user: @john,
                         name: 'Burger',
                         measurement_unit: 'Piece',
                         price: 5.03,
                         quantity: 10)
    @foods = Food.all
    @recipe1 = Recipe.create(user: @john,
                             name: 'Pasta',
                             preparation_time: '5',
                             cooking_time: '10',
                             description: 'Delicious pasta dish',
                             public: true)
    @recipe2 = Recipe.create(user: @john,
                             name: 'Salad',
                             preparation_time: '10',
                             cooking_time: '0',
                             description: 'Healthy salad recipe',
                             public: true)
    @ingredient1 = RecipeFood.create(recipe: @recipe1, food: @food1, quantity: 1000)
    @ingredient2 = RecipeFood.create(recipe: @recipe1, food: @food2, quantity: 1000)
  end
  before(:each) do
    sign_in @john
  end

  it 'I can see the total amount' do
    visit shoppings_path(@recipe1)
    expect(page).to have_content('$10.06')
  end

  it 'I can see the total item' do
    visit shoppings_path(@recipe1)
    expect(page).to have_content(2)
  end

  def delete_all
    RecipeFood.delete_all
    Food.delete_all
    Recipe.delete_all
    User.delete_all
  end
end

require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  include Devise::Test::IntegrationHelpers
  before(:all) do
    Food.delete_all

    @user = User.first
    @user ||= User.create!(
      email: 'john.doe@mail.com',
      password: 'admin1234',
      confirmed_at: Time.now
    )

    @food1 = Food.create(user: @user,
                         name: 'Pizza',
                         measurement_unit: 'Slice',
                         price: 8.99,
                         quantity: 5)
    @food2 = Food.create(user: @user,
                         name: 'Burger',
                         measurement_unit: 'Piece',
                         price: 5.99,
                         quantity: 10)
    @foods = Food.all
  end

  before(:each) do
    sign_in @user
  end

  it 'allows adding a new food' do
    visit foods_path
    click_link 'Add Food'

    fill_in 'Name', with: 'Sushi'
    fill_in 'Measurement unit', with: 'Roll'
    fill_in 'Price', with: '12.99'
    fill_in 'Quantity', with: '3'

    click_button 'Create Food'

    expect(page).to have_content('Food was successfully created.')
  end

  it 'allows removing a food' do
    visit foods_path

    first(:link, 'Remove').click
    expect(page).to have_content('Food was successfully destroyed.')
  end
end

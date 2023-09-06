# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Food.destroy_all
User.destroy_all

quantity_users = 10
quantity_foods = 10
users = []

for user_position in 1..quantity_users do
  temp_user = User.create!(
    email: "email#{user_position}@email.com",
    password: "abcdef"
  )
  #temp_user.skip_confirmation!
  temp_user.save!
  users << temp_user
end

for user_position in 0..(quantity_users - 1) do
  for food_position in 0..Random.rand(quantity_foods) do
    temp_food = Food.create!(
      user: users[user_position],
      name: "Food ##{food_position + 1}",
      measurement_unit: "grams",
      price: 10.0,
      quantity: food_position
    )
  end
end

puts "Created #{User.count} users"
puts "Created #{Food.count} posts"

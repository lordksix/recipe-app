class AddForeignKeyToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :recipes, :users, column: :user_id
  end
end

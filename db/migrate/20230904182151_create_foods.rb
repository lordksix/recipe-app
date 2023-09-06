class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :measurement_unit
      t.decimal :price, null: false, default: 0.0
      t.decimal :quantity, null: false, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

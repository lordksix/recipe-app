class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 200 }
  validates :measurement_unit, presence: true, length: { maximum: 100 }
end

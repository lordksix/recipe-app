class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true, length: { maximum: 200 }
  validates :description, :preparation_time, :cooking_time, presence: true
end

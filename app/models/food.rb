class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :recipes, through: :recipe_food
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
end

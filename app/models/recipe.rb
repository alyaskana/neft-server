class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :recipe_plants, dependent: :destroy
  has_many :plants, through: :recipe_plants
end

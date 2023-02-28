class Seed < ApplicationRecord
  has_one_attached :image
  has_one_attached :growing_image
  belongs_to :plant
  has_many :seed_stocks, dependent: :destroy
end

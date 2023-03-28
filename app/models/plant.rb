class Plant < ApplicationRecord
  has_one_attached :image
  has_one_attached :seed_image

  has_many :crops, dependent: :destroy
  has_many :seed_stocks, class_name: 'SeedStock', foreign_key: 'plant_id', dependent: :destroy
end

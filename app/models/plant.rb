class Plant < ApplicationRecord
  has_one_attached :image
  has_one :seed, dependent: :destroy
  has_many :crops, dependent: :destroy
end

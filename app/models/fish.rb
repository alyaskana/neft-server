class Fish < ApplicationRecord
  belongs_to :user
  has_many :skills
  has_one_attached :image
end

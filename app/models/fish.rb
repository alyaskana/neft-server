class Fish < ApplicationRecord
  belongs_to :user
  has_many :skills
  has_one_attached :image

  enum explore_stages: { calm: 'calm', exploring: 'exploring', explore_ready: 'explore_ready' }
end

class GrowingSeed < ApplicationRecord
  belongs_to :cell
  belongs_to :plant
  belongs_to :user

  enum stages: { stone: 'growing', grass: 'complete' }
end

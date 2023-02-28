class Cell < ApplicationRecord
  belongs_to :plot
  has_one :plant
  has_one :growing_seed
  has_one :seed, through: :growing_seed

  enum land_types: { stone: 'stone', grass: 'grass', garden_bed: 'garden_bed' }
end

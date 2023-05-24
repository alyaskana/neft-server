class Cell < ApplicationRecord
  belongs_to :plot
  has_one :plant
  has_one :growing_seed, dependent: :destroy
  has_one :cell_mineral, dependent: :destroy
  has_one :plant, through: :growing_seed
  has_one :mineral, through: :cell_mineral

  enum land_types: { stone: 'stone', grass: 'grass', garden_bed: 'garden_bed' }
end

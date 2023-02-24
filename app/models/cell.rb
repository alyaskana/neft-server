class Cell < ApplicationRecord
  belongs_to :plot
  has_one :plant

  enum land_types: { stone: 'stone', grass: 'grass', garden_bed: 'garden_bed' }
end

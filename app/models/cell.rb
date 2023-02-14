class Cell < ApplicationRecord
  belongs_to :plot
  has_one :plant

  enum land_types: { resource: 'resource', unavailable: 'unavailable', available: 'available' }
end

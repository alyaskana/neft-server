class CellMineral < ApplicationRecord
  belongs_to :cell
  belongs_to :mineral
  belongs_to :user

  enum stages: { recovering: 'recovering', ready: 'ready' }
end

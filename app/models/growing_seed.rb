class GrowingSeed < ApplicationRecord
  belongs_to :cell
  belongs_to :seed
  belongs_to :user
end

class RecipePlant < ApplicationRecord
  belongs_to :recipe
  belongs_to :plant
end

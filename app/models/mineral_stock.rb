class MineralStock < ApplicationRecord
  belongs_to :user
  belongs_to :mineral
end

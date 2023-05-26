class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  enum stages: { cooking: 'cooking', ready: 'ready' }
end

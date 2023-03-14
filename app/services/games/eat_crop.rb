module Games
  class EatCrop < ApplicationService
    def call(user, crop_id, fish_id)
      crop = Crop.find_by(user: user, id: crop_id)
      fish = Fish.find_by(user: user, id: fish_id)
      fish.update!(experience: fish.experience + crop.plant.experience)
      crop.update!(count: crop.count - 1)
    end
  end
end

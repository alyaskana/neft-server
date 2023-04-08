module Games
  class EatCrop < ApplicationService
    def call(user, crop_id, fish_id)
      crop = Crop.find_by(user: user, id: crop_id)
      fish = Fish.find_by(user: user, id: fish_id)
      xp = fish.experience + crop.plant.experience
      fish.update!(experience: xp, level: (0.05 * Math.sqrt(xp) + 1).to_i)
      crop.update!(count: crop.count - 1)
    end
  end
end

module Games
  class Harvesting < ApplicationService
    def call(user, growing_seed_id)
      growing_seed = GrowingSeed.find_by(user: user, id: growing_seed_id)
      crop = Crop.find_or_create_by(user: user, plant: growing_seed.plant) do |crop_item|
        crop_item.count = 0
      end
      crop.update!(count: crop.count + 1)
      growing_seed.destroy!

      GameChannel.broadcast_to(user, {
                                 type: 'newNotification',
                                 data: {
                                   icon: 'plant',
                                   message: '+ 1',
                                   createdAt: Time.now
                                 }
                               })
    end
  end
end

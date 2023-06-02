module Games
  class SellCrop < ApplicationService
    def call(user, crop_id)
      crop = Crop.find_by(user: user, id: crop_id)
      if (crop.count - 1) >= 0
        crop.update!(count: crop.count - 1)
        wallet = user.wallet
        wallet.update!(dsc: wallet.dsc + crop.plant.price)

        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'plant',
                                     message: '- 1',
                                     createdAt: Time.now
                                   }
                                 })
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'money',
                                     message: "+ #{crop.plant.price}",
                                     createdAt: Time.now
                                   }
                                 })
      end
    end
  end
end

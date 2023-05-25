module Games
  class SellCrop < ApplicationService
    def call(user, crop_id)
      crop = Crop.find_by(user: user, id: crop_id)
      if (crop.count - 1) >= 0
        crop.update!(count: crop.count - 1)
        wallet = user.wallet
        wallet.update!(dsc: wallet.dsc + crop.plant.price)
      end
    end
  end
end

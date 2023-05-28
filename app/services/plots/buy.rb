module Plots
  class Buy < ApplicationService
    def call(user)
      plots = user.plots
      wallet = user.wallet
      fish = user.fishes.find_by(is_active: true)
      mineral_stock = user.mineral_stocks[0]

      if plots.count == 3
        requiredMoney = 1500
        requiredLevel = 3
        requiredMineral = 10
      elsif plots.count == 4
        requiredMoney = 2000
        requiredLevel = 4
        requiredMineral = 15
      else
        requiredMoney = 3000
        requiredLevel = 6
        requiredMineral = 30
      end

      if requiredMoney <= wallet.dsc && requiredLevel <= fish.level && requiredMineral <= mineral_stock.count
        wallet.update!(dsc: wallet.dsc - requiredMoney)
        mineral_stock.update!(count: mineral_stock.count - requiredMineral)
        Plots::Create.call(user)
      end
    end
  end
end

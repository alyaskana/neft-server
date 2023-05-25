module Games
  class SellMineral < ApplicationService
    def call(user, mineral_stock_id)
      mineral_stock = MineralStock.find_by(user: user, id: mineral_stock_id)
      if (mineral_stock.count - 1) >= 0
        mineral_stock.update!(count: mineral_stock.count - 1)
        wallet = user.wallet
        wallet.update!(dsc: wallet.dsc + mineral_stock.mineral.price)
      end
    end
  end
end

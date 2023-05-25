module Games
  class CollectMineral < ApplicationService
    def call(user, cell_mineral_id, instrument_stock_id)
      cell_mineral = CellMineral.find_by(user: user, id: cell_mineral_id)
      mineral_stock = MineralStock.find_or_create_by!(user: user, mineral: cell_mineral.mineral)
      mineral_stock.update!(count: mineral_stock.count + 1)

      instrument_stock = InstrumentStock.find_by(user: user, id: instrument_stock_id)
      instrument_stock.update!(count: instrument_stock.count - 1)

      cell_mineral.update!(stage: :recovering, final_recover_time: Time.now + cell_mineral.mineral.recovery_time)
      RecoverMineralJob.set(wait_until: cell_mineral.final_recover_time).perform_later(cell_mineral)
    end
  end
end

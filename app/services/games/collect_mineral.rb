module Games
  class CollectMineral < ApplicationService
    def call(user, cell_mineral_id, instrument_stock_id)
      cell_mineral = CellMineral.find_by(user: user, id: cell_mineral_id)
      mineral_stock = MineralStock.find_or_create_by!(user: user, mineral: cell_mineral.mineral)
      mineral_stock.update!(count: mineral_stock.count + 1)

      instrument_stock = InstrumentStock.find_by(user: user, id: instrument_stock_id)
      instrument_stock.update!(count: instrument_stock.count - 1)

      final_recover_time = Time.now + cell_mineral.mineral.recovery_time
      call_job_time = Time.now + cell_mineral.mineral.recovery_time / 250 - 2

      cell_mineral.update!(stage: :recovering, final_recover_time: final_recover_time)
      RecoverMineralJob.set(wait_until: call_job_time).perform_later(cell_mineral)
      GameChannel.broadcast_to(user, {
                                 type: 'newNotification',
                                 data: {
                                   icon: 'instrument',
                                   message: '- 1',
                                   createdAt: Time.now
                                 }
                               })
      GameChannel.broadcast_to(user, {
                                 type: 'newNotification',
                                 data: {
                                   icon: 'mineral',
                                   message: '+ 1',
                                   createdAt: Time.now
                                 }
                               })
    end
  end
end

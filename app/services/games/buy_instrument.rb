module Games
  class BuyInstrument < ApplicationService
    def call(user, instrument_id)
      instrument = Instrument.find(instrument_id)
      wallet = user.wallet
      instrument_stock = InstrumentStock.find_or_create_by!(user: user, instrument: instrument) do |instrument_stock|
        instrument_stock.count = 0
      end
      if (wallet.dsc - instrument.price) >= 0
        instrument_stock.update!(count: instrument_stock.count + 1)
        wallet.update!(dsc: wallet.dsc - instrument.price)
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'instrument',
                                     message: '+ 1',
                                     createdAt: Time.now
                                   }
                                 })
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'money',
                                     message: "- #{instrument.price}",
                                     createdAt: Time.now
                                   }
                                 })
      end
    end
  end
end

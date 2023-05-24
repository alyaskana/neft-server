module Games
  class BuyInstrument < ApplicationService
    def call(user, instrument_id)
      instrument = Instrument.find(instrument_id)
      wallet = user.wallet
      instrument_stock = InstrumentStock.find_or_create_by!(user: user, instrument: instrument)
      instrument_stock.update!(count: instrument_stock.count + 1)
      wallet.update!(dsc: wallet.dsc - instrument.price)
    end
  end
end

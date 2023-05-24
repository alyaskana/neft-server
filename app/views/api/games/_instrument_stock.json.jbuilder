json.extract! instrument_stock, :id, :count

json.instrument do
  json.partial! partial: '/api/games/instrument', locals: { instrument: instrument_stock.instrument }
end

json.type 'instrument_stock'

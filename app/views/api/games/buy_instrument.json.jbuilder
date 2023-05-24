json.wallet do
  json.partial! partial: '/api/games/wallet', locals: { wallet: @wallet }
end

json.instrument_stocks do
  json.array! @instrument_stocks, partial: '/api/games/instrument_stock', as: :instrument_stock
end

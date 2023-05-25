json.wallet do
  json.partial! partial: '/api/games/wallet', locals: { wallet: @wallet } if @wallet
end

json.mineral_stocks do
  json.array! @mineral_stocks, partial: '/api/games/mineral_stock', as: :mineral_stock
end

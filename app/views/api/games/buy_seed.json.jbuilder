json.wallet do
  json.partial! partial: '/api/games/wallet', locals: { wallet: @wallet }
end

json.seed_stocks do
  json.array! @seed_stocks, partial: '/api/games/seed_stock', as: :seed_stock
end

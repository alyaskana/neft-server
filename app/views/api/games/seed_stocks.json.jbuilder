json.seed_stocks do
  json.array! seed_stocks, partial: '/api/games/seed_stock', as: :seed_stock
end

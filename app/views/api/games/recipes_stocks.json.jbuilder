json.mineral_stocks do
  json.array! mineral_stocks, partial: '/api/games/mineral_stock', as: :mineral_stock
end

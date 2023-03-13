
json.plots do
  json.array! @plots, partial: '/api/games/plot', as: :plot
end

json.seed_stocks do
  json.array! @seed_stocks, partial: '/api/games/seed_stock', as: :seed_stock
end

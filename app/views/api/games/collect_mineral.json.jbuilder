json.plots do
  json.array! @plots, partial: '/api/games/plot', as: :plot
end

json.mineral_stocks do
  json.array! @mineral_stocks, partial: '/api/games/mineral_stock', as: :mineral_stock
end

json.instrument_stocks do
  json.array! @instrument_stocks, partial: '/api/games/instrument_stock', as: :instrument_stock
end

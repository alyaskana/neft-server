json.extract! plot, :id
json.cells do
  json.array! plot.cells, partial: '/api/games/cell', as: :cell
end

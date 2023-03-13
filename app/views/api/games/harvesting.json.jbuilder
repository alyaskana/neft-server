json.plots do
  json.array! @plots, partial: '/api/games/plot', as: :plot
end

json.crops do
  json.array! @crops, partial: '/api/games/crop', as: :crop
end

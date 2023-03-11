json.plots do
  json.array! @plots, partial: '/api/games/plot', as: :plot
end

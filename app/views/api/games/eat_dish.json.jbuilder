json.fishes do
  json.array! @fishes, partial: '/api/games/fish', as: :fish
end

json.dishes do
  json.array! @dishes, partial: '/api/games/dish', as: :dish
end

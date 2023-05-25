json.fishes do
  json.array! @fishes, partial: '/api/games/fish', as: :fish
end

json.recipe_stocks do
  json.array! @recipe_stocks, partial: '/api/games/recipe_stock', as: :recipe_stock
end

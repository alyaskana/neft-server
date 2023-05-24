json.extract! recipe_stock, :id, :count

json.recipe do
  json.partial! partial: '/api/games/recipe', locals: { recipe: recipe_stock.recipe }
end

json.type 'recipe_stock'

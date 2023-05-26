json.extract! user_recipe, :id, :stage, :final_cook_time

json.recipe do
  json.partial! partial: '/api/games/recipe', locals: { recipe: user_recipe.recipe }
end

json.type 'user_recipe'

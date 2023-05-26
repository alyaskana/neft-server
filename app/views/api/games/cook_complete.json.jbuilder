json.dishes do
  json.array! dishes, partial: '/api/games/dish', as: :dish
end

json.user_recipes do
  json.array! user_recipes, partial: '/api/games/user_recipe', as: :user_recipe
end

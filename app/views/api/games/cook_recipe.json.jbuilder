json.user_recipes do
  json.array! @user_recipes, partial: '/api/games/user_recipe', as: :user_recipe
end

json.crops do
  json.array! @crops, partial: '/api/games/crop', as: :crop
end

json.fishes do
  json.array! @fishes, partial: '/api/games/fish', as: :fish
end

json.seed_stocks do
  json.array! @seed_stocks, partial: '/api/games/seed_stock', as: :seed_stock
end

json.user_recipes do
  json.array! @user_recipes, partial: '/api/games/user_recipe', as: :user_recipe
end

json.fishes do
  json.array! @fishes, partial: '/api/games/fish', as: :fish
end

json.plants do
  json.array! @plants, partial: '/api/games/plant', as: :plant
end

json.plots do
  json.array! @plots, partial: '/api/games/plot', as: :plot
end

json.resources do
  json.array! @resources, partial: '/api/games/resource', as: :resource
end

json.minerals do
  json.array! @minerals, partial: '/api/games/mineral', as: :mineral
end

json.recipes do
  json.array! @recipes, partial: '/api/games/recipe', as: :recipe
end

json.instruments do
  json.array! @instruments, partial: '/api/games/instrument', as: :instrument
end

json.wallet do
  json.partial! partial: '/api/games/wallet', locals: { wallet: @wallet } if @wallet
end

json.seed_stocks do
  json.array! @seed_stocks, partial: '/api/games/seed_stock', as: :seed_stock
end

json.instrument_stocks do
  json.array! @instrument_stocks, partial: '/api/games/instrument_stock', as: :instrument_stock
end

json.mineral_stocks do
  json.array! @mineral_stocks, partial: '/api/games/mineral_stock', as: :mineral_stock
end

json.user_recipes do
  json.array! @user_recipes, partial: '/api/games/user_recipe', as: :user_recipe
end

json.dishes do
  json.array! @dishes, partial: '/api/games/dish', as: :dish
end

json.crops do
  json.array! @crops, partial: '/api/games/crop', as: :crop
end

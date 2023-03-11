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

json.wallet do
  json.partial! partial: '/api/games/wallet', locals: { wallet: @wallet } if @wallet
end

json.seed_stocks do
  json.array! @seed_stocks, partial: '/api/games/seed_stock', as: :seed_stock
end

json.crops do
  json.array! @crops, partial: '/api/games/crop', as: :crop
end

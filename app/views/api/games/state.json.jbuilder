json.fishes do
  json.array! @fishes, partial: 'fish', as: :fish
end

json.plants do
  json.array! @plants, partial: 'plant', as: :plant
end

json.plots do
  json.array! @plots, partial: 'plot', as: :plot
end

json.seeds do
  json.array! @seeds, partial: 'seed', as: :seed
end

json.resources do
  json.array! @resources, partial: 'resource', as: :resource
end

json.wallet do
  json.partial! partial: 'wallet', locals: { wallet: @wallet }
end

json.seed_stock do
  json.array! @user_seeds, partial: 'seed_stock', as: :seed_stock
end

json.crops do
  json.array! @crops, partial: 'crop', as: :crop
end

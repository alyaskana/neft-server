json.extract! recipe_plant, :id, :count

json.plant do
  json.partial! partial: '/api/games/plant', locals: { plant: recipe_plant.plant }
end

json.type 'recipe_plant'

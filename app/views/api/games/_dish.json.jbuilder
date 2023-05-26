json.extract! dish, :id, :count, :stage

json.recipe do
  json.partial! partial: '/api/games/recipe', locals: { recipe: dish.recipe }
end

json.type 'dish'

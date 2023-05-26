json.extract! recipe, :id, :name, :description, :experience, :cooking_time
json.image rails_blob_url(recipe.image)

json.recipe_plants do
  json.array! recipe.recipe_plants, partial: '/api/games/recipe_plant', as: :recipe_plant
end

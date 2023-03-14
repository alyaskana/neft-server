json.fishes do
  json.array! @fishes, partial: '/api/games/fish', as: :fish
end

json.crops do
  json.array! @crops, partial: '/api/games/crop', as: :crop
end

json.fishes do
  json.array! fishes, partial: '/api/games/fish', as: :fish
end

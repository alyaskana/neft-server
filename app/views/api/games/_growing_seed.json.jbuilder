json.extract! growing_seed, :id, :created_at, :growing_time, :final_grow_time, :stage

json.plant do
  json.partial! partial: '/api/games/plant', locals: { plant: growing_seed.plant }
end

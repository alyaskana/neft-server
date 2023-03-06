json.extract! growing_seed, :id, :created_at, :growing_time, :final_grow_time, :stage

json.seed do
  json.partial! partial: '/api/games/seed', locals: { seed: growing_seed.seed }
end

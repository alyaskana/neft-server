json.extract! growing_seed, :id, :created_at, :growing_time

json.seed do
  json.partial! partial: '/api/games/seed', locals: { seed: growing_seed.seed }
end

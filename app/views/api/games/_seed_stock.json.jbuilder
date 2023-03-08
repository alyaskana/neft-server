json.extract! seed_stock, :id, :count

json.plant do
  json.partial! partial: '/api/games/plant', locals: { plant: seed_stock.plant }
end

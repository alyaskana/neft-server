json.extract! seed_stock, :id, :count

json.seed do
  json.partial! partial: 'seed', locals: { seed: seed_stock.seed }
end

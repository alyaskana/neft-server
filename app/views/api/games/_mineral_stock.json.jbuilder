json.extract! mineral_stock, :id, :count

json.mineral do
  json.partial! partial: '/api/games/mineral', locals: { mineral: mineral_stock.mineral }
end

json.type 'mineral_stock'

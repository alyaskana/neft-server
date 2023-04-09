json.wallet do
  json.partial! partial: '/api/games/wallet', locals: { wallet: @wallet } if @wallet
end

json.crops do
  json.array! @crops, partial: '/api/games/crop', as: :crop
end

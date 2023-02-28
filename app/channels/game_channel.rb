class GameChannel < ApplicationCable::Channel
  include ChannelHelper

  def subscribed
    stream_for current_user
    stream_from 'game_channel'
  end

  def receive(data)
    p 'received message:', data
    case data['type']
    when 'getStash'
      message = {
        type: 'stashUpdate',
        data: Stashes::GetStash.call(current_user)
      }
      GameChannel.broadcast_to(current_user, message)
    when 'plantSeed'
      handle_plant_seed(data)
    end
    # GameChannel.broadcast_to(current_user, data)
  end

  def unsubscribed
    p 'UNSUBSCRIBE'
  end

  private

  def handle_plant_seed(data)
    Games::PlantSeed.call(data['data']['cell_id'], data['data']['seed_stock_id'])
    message = {
      type: 'updatePlots',
      data: render_json(
        template: 'api/games/plots',
        locals: { plots: current_user.plots }
      )
    }
    GameChannel.broadcast_to(current_user, message)

    message = {
      type: 'updateSeedStocks',
      data: render_json(
        template: 'api/games/seed_stocks',
        locals: { seed_stocks: current_user.seed_stocks }
      )
    }
    GameChannel.broadcast_to(current_user, message)
  end
end

class GameChannel < ApplicationCable::Channel
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
    end
    # GameChannel.broadcast_to(current_user, data)
  end

  def unsubscribed
    p 'UNSUBSCRIBE'
  end
end

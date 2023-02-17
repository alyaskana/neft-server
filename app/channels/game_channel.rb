class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    stream_from 'game_channel'
  end

  def receive(data)
    p 'received message:', data
    GameChannel.broadcast_to(current_user, data)
  end

  def unsubscribed
    p 'UNSUBSCRIBE'
  end
end

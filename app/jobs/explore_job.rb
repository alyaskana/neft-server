class ExploreJob < ApplicationJob
  include ChannelHelper
  queue_as :default

  def perform(fish)
    user = fish.user
    fish.update!(explore_stage: 'explore_ready')
    message = {
      type: 'exploreReady',
      data: render_json(
        template: 'api/games/explore_ready',
        locals: { fishes: user.fishes }
      )
    }

    GameChannel.broadcast_to(user, message)
  end
end

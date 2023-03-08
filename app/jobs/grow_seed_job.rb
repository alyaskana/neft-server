class GrowSeedJob < ApplicationJob
  include ChannelHelper
  queue_as :default

  def perform(growing_seed)
    growing_seed.update!(stage: 'complete')
    user = growing_seed.user
    message = {
      type: 'updatePlots',
      data: render_json(
        template: 'api/games/plots',
        locals: { plots: user.plots }
      )
    }

    GameChannel.broadcast_to(user, message)
  end
end

class RecoverMineralJob < ApplicationJob
  include ChannelHelper
  queue_as :default

  def perform(cell_mineral)
    cell_mineral.update!(stage: 'ready')
    user = cell_mineral.user
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

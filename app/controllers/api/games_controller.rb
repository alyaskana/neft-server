class Api::GamesController < ApplicationController
  before_action :authenticate_cookie

  def state
    data = Games::GetCurrentState.call(current_user)
    @plants = data[:plants]
    @resources = data[:resources]
    @fishes = data[:fishes]
    @plots = data[:plots]
    @wallet = data[:wallet]
    @seed_stocks = data[:seed_stocks]
    @crops = data[:user_crops]
    render :state
  end
end

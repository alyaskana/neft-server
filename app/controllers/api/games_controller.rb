class Api::GamesController < ApplicationController
  before_action :authenticate_cookie

  def state
    data = Games::GetCurrentState.call(current_user)
    @plants = data[:plants]
    @resources = data[:resources]
    @seeds = data[:seeds]
    @fishes = data[:fishes]
    @plots = data[:plots]
    @wallet = data[:wallet]
    @user_seeds = data[:user_seeds]
    @crops = data[:user_crops]
    render :state
  end
end

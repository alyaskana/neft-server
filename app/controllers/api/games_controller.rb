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

  def buy_seed
    Games::BuySeed.call(current_user, params[:plant_id])
    @seed_stocks = current_user.seed_stocks
    @wallet = current_user.wallet
    render :buy_seed
  end

  def new_plot
    Plots::Create.call(current_user)
    @plots = current_user.plots
    render :new_plot
  end
end

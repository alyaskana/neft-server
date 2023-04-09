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

  def plant_seed
    Games::PlantSeed.call(params['cell_id'], params['seed_stock_id'])
    @plots = current_user.plots
    @seed_stocks = current_user.seed_stocks
    render :plant_seed
  end

  def harvesting
    Games::Harvesting.call(current_user, params['growing_seed_id'])
    @plots = current_user.plots
    @crops = current_user.crops
    render :harvesting
  end

  def eat_crop
    Games::EatCrop.call(current_user, params['crop_id'], params['fish_id'])
    @crops = current_user.crops
    @fishes = current_user.fishes
    render :eat_crop
  end

  def sell_crop
    Games::SellCrop.call(current_user, params['crop_id'])
    @crops = current_user.crops
    @wallet = current_user.wallet
    render :sell_crop
  end
end

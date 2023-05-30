class Api::GamesController < ApplicationController
  before_action :authenticate_cookie

  def state
    data = Games::GetCurrentState.call(current_user)
    @plants = data[:plants]
    @resources = data[:resources]
    @fishes = data[:fishes]
    @plots = data[:plots]
    @instruments = data[:instruments]
    @recipes = data[:recipes]
    @minerals = data[:minerals]
    @wallet = data[:wallet]
    @seed_stocks = data[:seed_stocks]
    @user_recipes = data[:user_recipes]
    @mineral_stocks = data[:mineral_stocks]
    @instrument_stocks = data[:instrument_stocks]
    @crops = data[:user_crops]
    @dishes = data[:dishes]
    render :state
  end

  def buy_seed
    Games::BuySeed.call(current_user, params[:plant_id])
    @seed_stocks = current_user.seed_stocks
    @wallet = current_user.wallet
    render :buy_seed
  end

  def buy_instrument
    Games::BuyInstrument.call(current_user, params[:instrument_id])
    @instrument_stocks = current_user.instrument_stocks
    @wallet = current_user.wallet
    render :buy_instrument
  end

  def new_plot
    Plots::Buy.call(current_user)
    @mineral_stocks = current_user.mineral_stocks
    @wallet = current_user.wallet
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

  def collect_mineral
    Games::CollectMineral.call(current_user, params['cell_mineral_id'], params['instrument_stock_id'])
    @plots = current_user.plots
    @mineral_stocks = current_user.mineral_stocks
    @instrument_stocks = current_user.instrument_stocks
    render :collect_mineral
  end

  def eat_crop
    Games::EatCrop.call(current_user, params['crop_id'], params['fish_id'])
    @crops = current_user.crops
    @fishes = current_user.fishes
    render :eat_crop
  end

  def eat_dish
    Games::EatDish.call(current_user, params['dish_id'], params['dish_id'])
    @dishes = current_user.dishes
    @fishes = current_user.fishes
    render :eat_dish
  end

  def cook_recipe
    Games::CookRecipe.call(current_user, params['user_recipe_id'])
    @user_recipes = current_user.user_recipes
    @crops = current_user.crops
    render :cook_recipe
  end

  def sell_crop
    Games::SellCrop.call(current_user, params['crop_id'])
    @crops = current_user.crops
    @wallet = current_user.wallet
    render :sell_crop
  end

  def sell_mineral
    Games::SellMineral.call(current_user, params['mineral_stock_id'])
    @mineral_stocks = current_user.mineral_stocks
    @wallet = current_user.wallet
    render :sell_mineral
  end

  def update_skills
    Games::UpdateSkills.call(current_user, params['skills'])
    @fishes = current_user.fishes
    render :update_skills
  end
end

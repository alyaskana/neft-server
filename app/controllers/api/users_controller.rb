class Api::UsersController < ApplicationController
  before_action :authenticate_cookie, except: [:create]

  def index
    render json: User.all
  end

  # GET /api/users/{id}
  def show
    render json: User.find_by(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(params[:id])
    if user.destroy
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def current
    render json: @current_user
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end

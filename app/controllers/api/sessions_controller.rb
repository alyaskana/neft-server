class Api::SessionsController < ApplicationController
  before_action :authenticate_cookie, only: [:destroy]

  def destroy
    user = current_user
    if user
      cookies.delete(:jwt)
      render json: { status: 'OK', code: 200 }
    else
      render json: { status: 'session not found', code: 404 }
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode({ user_id: user.id })
      cookies.signed[:jwt] = { value: token, httponly: true, domain: 'localhost', same_site: :none, secure: true }
      render json: {
        user_id: user.id,
        username: user.username,
        email: user.email
      }
    else
      render json: { status: 'incorrect email or password', code: 422 }
    end
  end
end

class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  include JsonWebToken

  def authenticate_cookie
    @current_user = current_user
    return true if @current_user

    render json: { status: 'unauthorized', code: 401 }, status: :unauthorized
  end

  def current_user
    token = cookies.signed[:jwt]
    return nil unless token

    decoded_token = jwt_decode(token)
    User.find_by(id: decoded_token['user_id']) if decoded_token
  end
end

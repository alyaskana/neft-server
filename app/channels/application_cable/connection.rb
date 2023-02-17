module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include JsonWebToken
    identified_by :current_user

    def connect
      self.current_user = current_user
    end

    private

    def current_user
      token = cookies.signed[:jwt]
      return nil unless token

      decoded_token = jwt_decode(token)
      User.find_by(id: decoded_token['user_id']) if decoded_token
    end
  end
end

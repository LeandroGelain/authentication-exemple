require 'json_web_token'

module AuthenticateHelper
  def authenticate_user(user = create(:user))
    auth_token = JsonWebToken.encode(user_id: user.id, user_token: user.token, key: User::TOKEN_KEY)
    request.headers['AUTHORIZATION'] = auth_token
  end
end

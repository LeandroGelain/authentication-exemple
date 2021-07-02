class Authentication::Login < Devise::SessionsController
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    user = User.find_for_database_authentication(email: params[:email])
    raise ActiveRecord::Unauthorized unless user && user.valid_password?(params[:password])

    sign_in(user)
    token = authentication_token(user)
    response_user(user, token)
  end

  def response_user(user, token)
    {
      auth_token: token,
      user: {
        id: user.token,
        name: user.name,
        email: user.email,
        created_at: user.created_at.utc.to_i
      }
    }
  end

  def signin
    allow_params_authentication!
    authenticate_user!
  end
end

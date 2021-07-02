require 'jwt'

class AuthenticationController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  attr_reader :current_user

  def authenticate
    find_user_and_authorize!
    set_current
    token = authentication_token(@user)
    render json: response_user(current_user, token), status: :ok
  rescue StandardError
    not_authenticated
  end

  # :nocov:
  def find_user_and_authorize!
    @user = User.find_by!(email: params[:email])

    raise unless @user.valid_password?(params[:password])
  end

  def set_current
    @current_user = User.find(@user.id)
    ApplicationRecord.set_current(current_user)
  end
  # :nocov:

  def not_authenticated
    render json: { error: I18n.t('errors.messages.login_unauthorized') }, status: :unauthorized
  end

  def response_user(user, token)
    {
      auth_token: token,
      user: {
        name: user.name,
        email: user.email,
        created_at: user.created_at.utc.to_i
      }
    }
  end

  def authentication_token(user)
    JsonWebToken.encode(user_id: user.id, user_token: user.token, key: User::TOKEN_KEY)
  end
end

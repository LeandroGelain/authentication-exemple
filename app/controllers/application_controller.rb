class ApplicationController < ActionController::Base
  attr_reader :current_user

  protect_from_forgery with: :exception

  include Errors::ErrorsHandler

  skip_before_action :verify_authenticity_token

  def authenticate_user!
    decode_token
    set_current
  rescue StandardError
    not_authenticated
  end

  def decode_token
    request_token = request.headers['Authorization']
    @decripted_token ||= JsonWebToken.decode(request_token)
    @decripted_token
  end

  def set_current
    @current_user = User.find(@decripted_token['user_id'])
  end

  def not_authenticated
    render json: { message: I18n.t('errors.messages.not_authenticated') }, status: :unauthorized
  end

  # :nocov:
  def pagination(object)
    {
      current_page: object.current_page,
      per_page: object.per_page(params),
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end
  # :nocov:
end

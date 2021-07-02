class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    Users::Create.new(permitted_params).execute
    head :created
  end

  # :nocov:
  def me
    render json: @current_user, serializer: UserSerializer, status: :ok
  end
  # :nocov:

  def update
    # TODO
  end

  def update_password
    # TODO
  end

  private

  def permitted_params
    params.fetch(:user).permit(:name, :email, :cpf, :phone_number, :birth_date, :password, :password_confirmation)
  end
end

class CardsController < ApplicationController
  before_action :authenticate_user!

  def index
    render status: :ok, json: current_user.cards, each_serializer: CardSerializer
  end

  def create
    Cards::Create.new(permitted_params, current_user).execute
    head :created
  end

  def edit
    Cards::Edit.new(permitted_params, current_user).execute
    head :ok
  end

  def destroy
    current_user.cards.find(params[:id]).destroy!
    head :ok
  end

  def import_image; end

  private

  def permitted_params
    params.fetch(:card).permit(:id, :foreign_lang, :current_lang, :image)
  end
end

class Cards::Edit
  attr_accessor :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def execute
    ActiveRecord::Base.transaction do
      edit_card!
    end
  end

  private

  def edit_card!
    card = current_user.cards.find(params[:id])
    card.update!(params)
  end
end

class Cards::Create
  attr_accessor :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def execute
    create_cards!
  end

  private

  def create_cards!
    current_user.cards.create!(params.merge({ user_id: current_user.id }))
  end
end

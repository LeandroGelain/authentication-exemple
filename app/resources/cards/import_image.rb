class Cards::ImportImage
  attr_accessor :file, :card_id, :current_user

  def initialize(card_id, file, current_user)
    @card_id = card_id
    @file = file
    @current_user = current_user
  end

  def execute
    import_image!
  end

  private

  def import_image!
    card = current_user.cards.find(card_id)
    card.image = file
    card.save!
  end
end

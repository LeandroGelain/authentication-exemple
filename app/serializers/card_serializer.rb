class CardSerializer < ActiveModel::Serializer
  attributes :id, :current_lang, :foreign_lang, :image

  def image
    object.image.present? ? ENV['HTTP_HOST'] + object.image.url : nil
  end
end

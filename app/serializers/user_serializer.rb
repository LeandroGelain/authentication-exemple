class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birth_date, :phone_number
end

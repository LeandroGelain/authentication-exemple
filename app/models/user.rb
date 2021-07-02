class User < ApplicationRecord
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and, :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  TOKEN_KEY = Rails.application.secrets.secret_key_base.to_s

  # :nocov:
  def login
    @login || name || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
  # :nocov:

  def token
    return if id.blank?

    Encryption.encrypt({ id: id }, TOKEN_KEY)
  end

  def self.find_by_token(token)
    return if token.blank?

    id = Encryption.decrypt(token, TOKEN_KEY)[:id]
    find(id)
  end
end

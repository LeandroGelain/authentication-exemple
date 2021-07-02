# :nocov:
require 'jwt'

class Encryption
  def self.encrypt(payload, secret_key, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, secret_key)
  end

  def self.decrypt(token, secret_key)
    decoded = JWT.decode(token, secret_key)[0]
    HashWithIndifferentAccess.new decoded
  end
end
# :nocov:

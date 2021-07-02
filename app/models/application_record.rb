class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.set_current(user)
    @current_user = user
  end
end

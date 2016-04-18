class User < ActiveRecord::Base
  has_one :account

  def authenticate(password)
    return false unless account.authenticate(password)
    self
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end

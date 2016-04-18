class UniqueUserValidator < ActiveModel::Validator
  def validate(record)
    user_exists = User.exists?(email: record.email)
    if user_exists
      record.errors[:email] << 'User with email already exists'
    end
  end
end

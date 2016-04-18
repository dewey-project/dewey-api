class Token
  attr_reader :token

  def initialize(decoded_token)
    @token = decoded_token
  end

  def user
    user_id = payload[:user][:id]
    @user ||= User.find_by(id: user_id)
  end

  def header
    @header ||= @token[:header]
  end

  def payload
    @payload ||= @token[:payload]
  end
end

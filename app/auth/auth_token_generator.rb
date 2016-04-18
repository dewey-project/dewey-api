module AuthTokenGenerator
  class << self
    def generate(user)
      payload = {}
      payload[:user] = user_payload(user)
      AuthTokenEncoder.encode(payload)
    end

    def user_payload(user)
      {
        id: user.id,
        email: user.email
      }
    end
  end
end

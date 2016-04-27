# Easily create a token with a predefined user payload.
module AuthTokenGenerator
  class << self
    def generate(user)
      payload = Hash[user: user_payload(user)]
      AuthTokenEncoder.encode(payload)
    end

    def user_payload(user)
      Hash[id: user.id, email: user.email]
    end
  end
end

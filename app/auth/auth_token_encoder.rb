module AuthTokenEncoder
  class << self
    def encode(payload)
      hmac_secret = Rails.application.secrets.secret_key_base
      JWT.encode(payload, hmac_secret, 'HS256')
    end
  end
end

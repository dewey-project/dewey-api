# Wrapper for the JWT library encoding method. Automatically
# sets the secret used for encoding so the only thing
# that needs to be passed in is a payload.
#
# @param payload [Hash] the payload for the JWT token
# @return [String] the encoded Json Web Token
module AuthTokenEncoder
  class << self
    def encode(payload)
      hmac_secret = Rails.application.secrets.secret_key_base
      JWT.encode(payload, hmac_secret, 'HS256')
    end
  end
end

class JwtDecoder
  def initialize(application)
    @application = application
  end

  def call(environment)
    @environment = environment
    set_decoded_auth_token
    @application.call(@environment)
  end

  private

  def get_encoded_token
    @environment['HTTP_AUTHORIZATION']
  end

  def get_hmac_secret
    Rails.application.secrets.secret_key_base
  end

  def set_decoded_auth_token
    @environment['jwt.token'] = decode_token(get_encoded_token)
  end

  def decode_token(token)
    return nil if token.nil?
    JWT.decode(token, get_hmac_secret, true, { algorithm: 'HS256' })
  end
end

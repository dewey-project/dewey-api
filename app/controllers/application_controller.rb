class ApplicationController < ActionController::API
  before_action do
    # Make sure that all responses are compressed
    # Checkout Rack::Deflator middleware for more
    # details
    unless request.env.key?('HTTP_ACCEPT_ENCODING')
      request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'
    end

    # Make sure that all requests coming are considered
    # application/json
    request.format = :json

    auth_token = request.env['jwt.token']
    @token = auth_token.nil? ? nil : Token.new(auth_token)
  end

  def require_token!
    render json: no_token_error_message, status: 401 unless @token.present?
  end

  def no_token_error_message
    { message: 'No token in HTTP_AUTHORIZATION header' }
  end
end

class ApplicationController < ActionController::API
  before_action do
    # Make sure that all responses are compressed
    # Checkout Rack::Deflator middleware for more
    # details
    if !request.env.key?('HTTP_ACCEPT_ENCODING')
      request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'
    end

    # Make sure that all requests coming are considered
    # application/json
    request.format = :json

    auth_token = request.env['jwt.token']
    @token = auth_token.nil? ? nil : Token.new(auth_token)
  end

  def require_token!
    unless @token.present?
      error_json = { message: 'No token in HTTP_AUTHORIZATION header' }
      render json: error_json, status: 401
    end
  end
end

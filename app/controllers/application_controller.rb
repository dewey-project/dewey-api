class ApplicationController < ActionController::API
  before_action do
    @token = Token.new(request.env['jwt.token'])
  end

  def require_token!
    unless @token.present?
      error_json = { message: 'No token in HTTP_AUTHORIZATION header' }
      render json: error_json, status: 401
    end
  end
end

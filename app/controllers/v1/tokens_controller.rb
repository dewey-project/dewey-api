class V1::TokensController < ApplicationController
  def create
    user = User.find_by(email: allowed_params[:email])
    if user && user.authenticate
      @token = AuthTokenGenerator.generate(user)
    else
      error = { error: 'Invalid credentials' }
      render json: error, status: 401
    end
  end

  private

  def allowed_params
    params.require(:data).permit(:email, :password)
  end
end

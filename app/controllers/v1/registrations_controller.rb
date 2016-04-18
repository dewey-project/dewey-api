class V1::RegistrationsController < ApplicationController
  def create
    registration = RegistrationForm.new(user: User.new, account: Account.new)
    if registration.validate(allowed_params)
      user = registration.save
      @token = AuthTokenGenerator.generate(user)
    else
      render json: registration.errors, status: :unprocessable_entity
    end
  end

  private

  def allowed_params
    params.require(:data).permit(:email, :first_name, :last_name,
                                 :password, :password_confirmation)
  end
end

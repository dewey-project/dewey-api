class V1::Schools::SearchController < ApplicationController
  def index
    @schools = School.search(allowed_params[:term])
  end

  private

  def allowed_params
    params.require(:data).permit(:term)
  end
end

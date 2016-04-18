class V1::Departments::SearchController < ApplicationController
  def index
    @departments = Department.search(allowed_params[:term])
  end

  private

  def allowed_params
    params.require(:data).permit(:term)
  end
end

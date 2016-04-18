class V1::DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  private

  def allowed_params
    params.require(:data).permit(:title, :abbreviation, :description)
  end
end

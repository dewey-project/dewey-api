class V1::Schools::DepartmentsController < ApplicationController
  def index
    @school = School.includes(:departments).find(params[:id])
    @departments = @school.departments
  end
end

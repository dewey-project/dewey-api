class V1::DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(allowed_params)
    if @department.save
      render json: @department, status: 200
    else
      render json: @department.errors
    end
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(allowed_params)
      render json: @department
    else
      render json: @department.errors
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    render status: 200
  end

  private

  def allowed_params
    params.require(:data).permit(:title, :abbreviation, :description)
  end
end

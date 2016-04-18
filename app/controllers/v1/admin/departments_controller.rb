class V1::Admin::DepartmentsController < ApplicationController
  def create
    @department = Department.new(allowed_params)
    if @department.save
      render 'create'
    else
      render json: @department.errors
    end
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(allowed_params)
      render 'update'
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

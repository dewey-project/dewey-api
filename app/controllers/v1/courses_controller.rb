class V1::CoursesController < ApplicationController
  def index
    @courses = Course.includes(:department, :school)
  end

  def show
    @course = Course.includes(:department, :school).find(params[:id])
  end

  def create
    @course = Course.new(allowed_params)
    if @course.save
      render json: @course
    else
      render json: @course.errors
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.udpate(allowed_params)
      render json: @course
    else
      render json: @course.errors
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    render status: 200
  end

  private

  def allowed_params
    params.require(:data).permit(:title, :code, :school_id, :department_id)
  end
end

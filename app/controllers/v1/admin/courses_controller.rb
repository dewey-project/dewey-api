class V1::Admin::CoursesController < ApplicationController
  before_action :require_token!

  def create
    @course = Course.new(allowed_params)
    if @course.save
      render 'create'
    else
      render json: @course.errors
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.udpate(allowed_params)
      render 'update'
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
    params.require(:data).permit(:title, :code)
  end
end

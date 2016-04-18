class V1::SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(allowed_params)
    if @school.save
      render json: @school, status: 200
    else
      render json: @school.errors
    end
  end

  def update
    school = School.find(params[:id])
    if school.update(allowed_params)
      render json: school, status: 200
    else
      render json: school.errors
    end
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    render status: 200
  end

  private

  def allowed_params
    params.require(:data).permit(:title)
  end
end

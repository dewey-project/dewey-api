class V1::Admin::SchoolsController < ApplicationController
  before_action :require_token!

  def create
    @school = School.new(allowed_params)
    if @school.save
      render 'create'
    else
      render json: @school.errors
    end
  end

  def update
    @school = School.find(params[:id])
    if @school.update(allowed_params)
      render 'update'
    else
      render json: @school.errors
    end
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    head status: 200
  end

  private

  def allowed_params
    params.require(:data).permit(:title)
  end
end

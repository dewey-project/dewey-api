class V1::SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  private

  def allowed_params
    params.require(:data).permit(:title)
  end
end

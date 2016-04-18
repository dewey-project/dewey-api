class V1::CoursesController < ApplicationController
  def index
    @courses = Course.includes(department: [:school])
  end

  def show
    @course = Course.includes(department: [:school]).find(params[:id])
  end

  private

  def allowed_params
    params.require(:data).permit(:title, :code, :school_id, :department_id)
  end
end

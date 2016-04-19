class V1::Courses::SearchController < ApplicationController
  def index
    @courses = Course.includes(department: [:school])
                     .search(allowed_params[:term])

    unless allowed_params[:department_id].nil?
      @courses = @courses.by_department(allowed_params[:department_id])
    end

    @courses
  end

  private

  def allowed_params
    params.require(:data).permit(:term, :department_id)
  end
end

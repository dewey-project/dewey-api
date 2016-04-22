class V1::Courses::SearchController < ApplicationController
  def index
    @courses = Course.includes(department: [:school])
                     .search(params[:q])

    if params.key?(:department_id)
      @courses = @courses.by_department(params[:department_id])
    end

    @courses
  end
end

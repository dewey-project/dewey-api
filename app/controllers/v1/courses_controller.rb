class V1::CoursesController < ApplicationController
  def show
    @course = Course.includes(department: [:school]).find(params[:id])
  end
end

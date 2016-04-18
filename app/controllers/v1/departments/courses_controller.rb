class V1::Departments::CoursesController < ApplicationController
  def index
    @department = Department.includes(courses: [:school]).find(params[:id])
  end
end

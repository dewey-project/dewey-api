class V1::Schools::CoursesController < ApplicationController
  def index
    @school = School.includes(courses: [:department]).find(params[:id])
  end
end

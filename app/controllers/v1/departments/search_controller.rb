class V1::Departments::SearchController < ApplicationController
  def index
    @departments = Department.includes(:school).search(params[:q])
    if params.key?(:school_id)
      @departments = @departments.by_school(params[:school_id])
    end

    @departments
  end
end

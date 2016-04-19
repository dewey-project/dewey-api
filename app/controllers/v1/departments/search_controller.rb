class V1::Departments::SearchController < ApplicationController
  def index
    @departments = Department.includes(:school).search(allowed_params[:term])
    unless allowed_params[:school_id].nil?
      @departments = @departments.by_school(allowed_params[:school_id])
    end

    @departments
  end

  private

  def allowed_params
    params.require(:data).permit(:term, :school_id)
  end
end

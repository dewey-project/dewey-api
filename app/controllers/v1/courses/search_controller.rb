class V1::Courses::SearchController < ApplicationController
  def index
    @courses = Course.search(allowed_params[:term])
  end

  private

  def allowed_params
    params.require(:data).permit(:term)
  end
end

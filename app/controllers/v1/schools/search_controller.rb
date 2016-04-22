class V1::Schools::SearchController < ApplicationController
  def index
    @schools = School.search(params[:q])
  end
end

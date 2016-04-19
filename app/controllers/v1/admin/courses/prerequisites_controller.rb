class V1::Admin::Courses::PrerequisitesController < ApplicationController
  before_action :require_token!

  def create
    @source = Course.find_by(id: params[:id])
    @target = Course.find_by(id: params[:course_id])

    errors = generate_errors(@source, @target)
    if errors
      render json: errors, status: 404
    else
      @source.add_prerequisite(@target)
      render :create, status: 200
    end
  end

  def destroy
    @source = Course.find_by(id: params[:id])
    @target = Course.find_by(id: params[:course_id])

    errors = generate_errors(@source, @target)
    if errors
      render json: errors, status: 404
    else
      @source.remove_prerequisite(@target)
      head 204
    end
  end

  private

  def generate_errors(source, target)
    if source && target
      return nil
    end

    errors = {}
    if source.nil?
      errors[:source] = "Could not find source course"
    end

    if target.nil?
      errors[:target] = "Could not find target course"
    end

    return errors
  end
end

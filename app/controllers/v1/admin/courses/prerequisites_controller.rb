class V1::Admin::Courses::PrerequisitesController < ApplicationController
  before_action :require_token!

  def create
    @course = Course.find_by(id: allowed_params[:course_id])

    prerequisite_ids = allowed_params[:prerequisite_ids].map(&:to_i)
    @prerequisites = Course.where(id: prerequisite_ids).to_a

    errors = generate_errors(@course.id, prerequisite_ids, @prerequisites.map(&:id))
    if errors
      render json: errors, status: 404
    else
      @course.add_prerequisites(@prerequisites)
      render :create, status: 200
    end
  end

  def destroy
    @source = Course.find_by(id: params[:id])
    @target = Course.find_by(id: params[:course_id])

    errors = generate_errors(@source.id, [@target.id], [params[:course_id]])
    if errors
      render json: errors, status: 404
    else
      @source.remove_prerequisite(@target)
      head 204
    end
  end

  private

  def allowed_params
    params.require(:data).permit(:course_id, prerequisite_ids: [])
  end

  def generate_errors(course_id, expected_ids, actual_ids)
    actual_ids.map!(&:to_i)
    prerequisites_match = expected_ids == actual_ids

    if course_id && prerequisites_match
      return nil
    end

    errors = {}
    errors[:course] = "Could not find source course" if course_id.nil?

    if !prerequisites_match
      errors[:prerequisites] = []
      prerequisite_intersection = expected_ids - actual_ids
      errors[:prerequisites] = prerequisite_intersection.map do |id|
        "Could not find course with id of #{id}"
      end
    end

    return errors
  end
end

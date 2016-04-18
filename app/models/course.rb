class Course < ActiveRecord::Base
  # Provides methods to add, remove and view prequisites
  # for this course.
  include NeoPrerequisiteHelper

  validates :school_id, presence: true
  validates :department_id, presence: true
  validates :code, presence: true

  belongs_to :school
  belongs_to :department

  # Return the abbreviation for the course
  # example MATH-1314
  def abbreviation
    [department.abbreviation, code].join("-")
  end
end

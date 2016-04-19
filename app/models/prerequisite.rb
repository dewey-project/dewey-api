class Prerequisite < ActiveRecord::Base
  # Scopes
  scope :by_prerequisite, -> (id) { where(prerequisite_id: id) }

  # Validations
  validates :course_id, presence: true
  validates :prerequisite_id, presence: true

  # Associations
  belongs_to :course
  belongs_to :prerequisite, class_name: Course
end

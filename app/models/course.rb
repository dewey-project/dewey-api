class Course < ActiveRecord::Base
  include NeoPrerequisiteHelper
  include PgSearch

  pg_search_scope :search,
                  against: [:code, :title],
                  using: { tsearch: { prefix: true }}

  scope :by_department, -> (id) { where(department_id: id) }

  validates :department_id, presence: true
  validates :code, presence: true

  belongs_to :department

  # Return the abbreviation for the course
  # example MATH-1314
  def abbreviation
    [department.abbreviation, code].join("-")
  end
end

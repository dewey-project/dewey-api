CourseWithoutSameSchoolError = Class.new(StandardError)

class Course < ActiveRecord::Base
  include PgSearch

  # Scopes
  scope :by_department, -> (id) { where(department_id: id) }
  pg_search_scope :search, against: [:code, :title],
                  using: { tsearch: { prefix: true }}


  # Validations
  validates :department_id, presence: true
  validates :code, presence: true

  # Associations
  belongs_to :department
  has_many :course_prerequisites, class_name: Prerequisite
  has_many :prerequisites, through: :course_prerequisites, source: :prerequisite

  # Return the abbreviation for the course
  # example MATH-1314
  def abbreviation
    [department.abbreviation, code].join("-")
  end

  # Traverse the graph of prerequisites for a specific course.
  def prerequisite_graph(depth=:any)
    opts = Hash[rel_length: depth]

    node = get_course_node(self)
    course_ids = node.prerequisites(opts).to_a.map(&:course_id)
    Course.where(id: course_ids)
  end

  # Add a prerequisite to ActiveRecord and Neo4j
  def add_prerequisite(course)
    source_school = self.department.school
    target_school = course.department.school

    if source_school != target_school
      raise CourseWithoutSameSchoolError
    end

    self.prerequisites << course
    add_course_node_prerequisite(course)
  end

  # Remove a prerequisite from ActiveRecord and Neo4j
  def remove_prerequisite(course)
    prerequisite = Prerequisite.find_by(course_id: self.id,
                                        prerequisite_id: course.id)
    prerequisite.destroy
    remove_course_node_prerequisite(course)
  end

  private

  def get_course_node(course)
    node = CourseNode.find_by(course_id: course.id)
    return node unless node.nil?
    CourseNode.new(course_id: course.id, school_id: course.school_id)
  end

  def add_course_node_prerequisite(course)
    source_node = get_course_node(self)
    target_node = get_course_node(course)

    source_node.prerequisites << target_node
    source_node.save
  end

  def remove_course_node_prerequisite(course)
    source_node = get_course_node(self)
    final_prerequisites = source_node.prerequisites.to_a
                                     .select { |c| c.course_id != course.id }

    source_node.prerequisites = final_prerequisites
    source_node.save
  end
end

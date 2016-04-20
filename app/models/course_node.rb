class CourseNode
  include Neo4j::ActiveNode
  self.mapped_label_name = 'Course'

  property :course_id

  has_many :out, :prerequisites, type: 'HAS_PREREQUISITE', model_class: CourseNode
  has_many :out, :corequisites, type: 'HAS_COREQUISITE', model_class: CourseNode
end

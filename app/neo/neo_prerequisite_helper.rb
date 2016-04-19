module NeoPrerequisiteHelper
  class << self
    def included(base)
      define_method :get_course_node do |course|
        puts course.id
        node = CourseNode.find_by(course_id: course.id)
        return node unless node.nil?
        CourseNode.new(course_id: course.id, school_id: course.school_id)
      end

      define_method :prerequisites do |opts={}|
        node = get_course_node(self)
        course_ids = node.prerequisites(opts).to_a.map(&:course_id)
        Course.where(id: course_ids)
      end

      define_method :add_prerequisite do |course|
        self_node = get_course_node(self)
        course_node = get_course_node(course)

        self_node.prerequisites << course_node
        self_node.save
      end

      define_method :remove_prerequisite do |course|
        node = get_course_node(self)
        final_prerequisites = node.prerequisites.to_a
                                  .select { |c| c.course_id != course.id }

        node.prerequisites = final_prerequisites
        node.save
      end
    end
  end
end

require 'test_helper'

class AdminCoursePrerequisitesTest < ActionDispatch::IntegrationTest
  setup do
    school = School.create(traits(:lonestar))
    math = Department.create(traits(:math_department, school: school))

    @algebra = Course.create(traits(:algebra, department: math))
    @trig = Course.create(traits(:trigonometry, department: math))

    user = User.create(traits(:user))
    token = AuthTokenGenerator.generate(user)

    @headers = { 'HTTP_ACCEPT' => 'application/json',
                 'HTTP_AUTHORIZATION' => token }
  end

  teardown do
    CourseNode.destroy_all
  end

  test 'can add prerequisite to course' do
    post "/api/admin/courses/#{@trig.id}/prerequisites/#{@algebra.id}", nil, @headers

    algebra_node = CourseNode.find_by(course_id: @algebra.id)
    trig_node = CourseNode.find_by(course_id: @trig.id)

    assert_response 200
    assert_includes @trig.prerequisites, @algebra
    assert_not_nil algebra_node
    assert_not_nil trig_node
  end

  test 'can remove prerequisite from course' do
    @trig.prerequisites << @algebra
    delete "/api/admin/courses/#{@trig.id}/prerequisites/#{@algebra.id}", nil, @headers

    assert_response 204
    assert_not_includes(@trig.prerequisites, @algebra)
  end
end

require 'test_helper'

class CoursePrerequisitesTest < ActionDispatch::IntegrationTest
  setup do
    @headers = { 'HTTP_ACCEPT' => 'application/json' }

    school = School.create(traits(:lonestar))
    math = Department.create(traits(:math_department, school: school))

    @algebra = Course.create(traits(:algebra, department: math))
    @trig = Course.create(traits(:trigonometry, department: math))
    @calculus = Course.create(traits(:calculus, department: math))
  end

  teardown do
    CourseNode.destroy_all
  end

  test 'can view direct prerequisites for course' do
    @trig.prerequisites << @algebra
    get "/api/courses/#{@trig.id}/prerequisites", nil, @headers

    assert_response 200
    assert_equal 1, get_json_response[:data][:prerequisite_count]
  end

  test 'can view prerequisite graph for course' do
    @trig.add_prerequisite(@algebra)
    @calculus.add_prerequisite(@trig)

    get "/api/courses/#{@calculus.id}/prerequisites/graph", nil, @headers

    assert_response 200
    assert_equal 2, get_json_response[:data][:prerequisite_count]
  end
end

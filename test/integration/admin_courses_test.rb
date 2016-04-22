require 'test_helper'

class AdminCoursesTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(traits(:user))
    token = AuthTokenGenerator.generate(user)

    @school = School.create(traits(:lonestar))
    @department = Department.create(traits(:math_department, school: @school))

    @headers = { 'HTTP_ACCEPT' => 'application/json',
                'HTTP_AUTHORIZATION' => token }
  end

  test 'can add new course' do
    url = "/api/admin/departments/#{@department.id}/courses"
    request_body = { data: traits(:algebra) }
    post url, request_body, @headers

    assert_response 200
  end

  test 'cannot add new course without authentication token' do
    url = "/api/admin/departments/#{@department.id}/courses"
    request_body = { data: traits(:algebra) }
    post url, request_body, { 'HTTP_ACCEPT' => 'application/json' }

    assert_response 401
  end

  test 'can update course' do
  end

  test 'cannot update course without authentication token' do
  end

  test 'can delete course' do
  end

  test 'cannot delete course without authentication token' do
  end
end

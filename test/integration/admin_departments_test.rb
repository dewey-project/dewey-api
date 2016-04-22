require 'test_helper'

class AdminDepartmentsTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(traits(:user))
    token = AuthTokenGenerator.generate(user)

    @school = School.create(traits(:lonestar))
    @headers = { 'HTTP_ACCEPT' => 'application/json',
                 'HTTP_AUTHORIZATION' => token }
  end

  test 'can add new department' do
    url = "/api/admin/schools/#{@school.id}/departments"
    request_body = { data: traits(:math_department) }
    post url, request_body, @headers

    assert_response 200
    department = Department.find_by(title: 'Mathematics', school_id: @school.id)
    assert_not_nil department
  end

  test 'cannot add new department without authentication token' do
    url = "/api/admin/schools/#{@school.id}/departments"
    request_body = { data: traits(:math_department) }
    post url, request_body, { 'HTTP_ACCEPT' => 'application/json' }

    assert_response 401
  end

  test 'can update department' do
    department = Department.create(traits(:math_department, school: @school))
    request_body = { data: { title: 'English' }}
    put "/api/admin/departments/#{department.id}", request_body, @headers

    department = Department.find_by(title: 'English')
    assert_response 200
    assert_not_nil department
  end

  test 'cannot update department without authentication token' do
    department = Department.create(traits(:math_department, school: @school))
  end

  test 'can delete department' do
  end

  test 'cannot delete department without authentication token' do
  end
end

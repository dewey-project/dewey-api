require 'test_helper'

class DepartmentsTest < ActionDispatch::IntegrationTest
  setup do
    @headers = { 'HTTP_ACCEPT' => 'application/json' }

    @lonestar = School.create(traits(:lonestar))
    @texas_tech = School.create(traits(:texas_tech))

    @math = Department.create(traits(:math_department, school: @lonestar))
    @english = Department.create(traits(:english_department, school: @lonestar))
  end

  test 'view all the departments' do
    get '/api/departments', nil, @headers

    assert_equal 2, get_json_response[:data].size
  end

  test 'view a specific department' do
    get "/api/departments/#{@math.id}", nil, @headers

    refute get_json_response[:data].empty?
  end

  test 'can search departments' do
    request_body = { data: { term: 'Math' }}
    post '/api/departments/search', request_body, @headers

    assert_equal 1, get_json_response[:data].size
  end

  test 'can limit search of departments by school id' do
    Department.create(traits(:math_department, school: @texas_tech))

    request_body = { data: { term: 'Math', school_id: @lonestar.id }}
    post '/api/departments/search', request_body, @headers

    assert_equal 1, get_json_response[:data].size
  end
end

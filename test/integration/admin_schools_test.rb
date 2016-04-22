require 'test_helper'

class AdminSchoolsTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(traits(:user))
    token = AuthTokenGenerator.generate(user)

    @headers = { 'HTTP_ACCEPT' => 'application/json',
                 'HTTP_AUTHORIZATION' => token }
  end

  test 'can add new school' do
    request_body = { data: traits(:lonestar) }
    post '/api/admin/schools', request_body, @headers

    school_name = traits(:lonestar)[:title]
    school = School.find_by(title: school_name)
    assert_not_nil school
  end

  test 'cannot add school without authentication token' do
    request_body = { data: traits(:lonestar) }
    post '/api/admin/schools', request_body, { 'HTTP_ACCEPT' => 'application/json' }

    assert_response 401
  end

  test 'can update existing school' do
    school = School.create(traits(:lonestar))

    request_body = { data: { title: 'Not Lonestar' }}
    put "/api/admin/schools/#{school.id}", request_body, @headers

    found_school = School.find(school.id)
    assert_equal 'Not Lonestar', found_school.title
  end

  test 'cannot update existing school without authentication token' do
    school = School.create(traits(:lonestar))

    request_body = { data: { title: 'No Lonestar' }}
    put "/api/admin/schools/#{school.id}", request_body, @headers
  end

  test 'can remove school' do
    school = School.create(traits(:lonestar))
    delete "/api/admin/schools/#{school.id}", nil, @headers

    assert School.all.empty?
  end
end

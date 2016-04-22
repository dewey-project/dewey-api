require 'test_helper'

class SchoolsTest < ActionDispatch::IntegrationTest
  setup do
    @headers = { 'HTTP_ACCEPT' => 'application/json' }

    @lonestar = School.create(traits(:lonestar))
    @texas_tech = School.create(traits(:texas_tech))
  end

  test 'can get all schools' do
    get '/api/schools', nil, @headers

    assert_equal 2, get_json_response[:data].size
  end

  test 'can get specific school' do
    get "/api/schools/#{@lonestar.id}", nil, @headers

    refute get_json_response[:data].empty?
  end

  test 'can search schools' do
    get '/api/schools/search?q=Lonestar', nil, @headers
    assert_equal 1, get_json_response[:data].size
  end
end

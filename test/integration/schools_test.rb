require 'test_helper'

class SchoolsTest < ActionDispatch::IntegrationTest
  setup do
    @headers = { 'HTTP_ACCEPT' => 'application/json' }

    @lonestar = School.create(traits(:lonestar))
    @texas_tech = School.create(traits(:texas_tech))
  end

  test 'can get all schools' do
    get '/api/schools', nil, @headers

    json_body = JSON.parse(response.body)
    assert_equal 2, json_body['data'].size
  end

  test 'can get specific school' do
    get "/api/schools/#{@lonestar.id}", nil, @headers

    json_body = JSON.parse(response.body)
    refute json_body['data'].empty?
  end

  test 'can search schools' do
    request_body = { data: { term: 'Lone' }}
    post '/api/schools/search', request_body, @headers

    json_body = JSON.parse(response.body)
    assert_equal 1, json_body["data"].size
  end
end

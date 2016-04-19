ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'traits_setup'

class ActiveSupport::TestCase
  include Traits::Syntax
  fixtures :all

  def get_json_response
    HashWithIndifferentAccess.new(JSON.parse(response.body))
  end
end

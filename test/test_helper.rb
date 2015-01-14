ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def string_of(count, type=:characters)
    #Type is a placeholder. Can be modified to generate random integers when needed
    return (0...count).map { ('a'..'z').to_a[rand(26)] }.join
  end
end

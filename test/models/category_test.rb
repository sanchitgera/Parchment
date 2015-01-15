require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'validate parameters' do
    @category = Category.new
    assert_not @category.valid?
    assert_equal [:name], @category.errors.keys
  end
end

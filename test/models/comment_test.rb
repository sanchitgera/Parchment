require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'validate parameters' do
    @comment = Comment.new
    assert_not @comment.valid?
    assert_equal [:name, :body, :post], @comment.errors.keys
  end
end

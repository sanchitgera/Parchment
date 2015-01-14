require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new
  end
  test "validates presence of params" do
    @post.save

    assert_includes @post.errors[:title], "can't be blank"
    assert_includes @post.errors[:body], "can't be blank"

  end

  test "validates param lengths" do
    @post.title = string_of 4
    @post.body = string_of 100
    @post.save
    assert_equal [:title], @post.errors.keys

    @post.title = string_of 5
    @post.body = string_of 99
    @post.save
    assert_equal [:body], @post.errors.keys
  end
end

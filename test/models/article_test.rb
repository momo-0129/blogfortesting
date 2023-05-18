require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: "title1", description: "description1")
  end

  test "title should be valid" do
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "title should not be too long" do
    @article.title = "a" * 51
    assert_not @article.valid?
  end

  test "title should not be too short" do
    @article.title = "a" * 2
    assert_not @article.valid?
  end

  test "description should be valid" do
    assert @article.valid?
  end

  test "description should be present" do
    @article.description = " "
    assert_not @article.valid?
  end

  test "description should not be too long" do
    @article.description = "a" * 500
    assert_not @article.valid?
  end

  test "description should not be too short" do
    @article.description = "a" * 2
    assert_not @article.valid?
  end

end

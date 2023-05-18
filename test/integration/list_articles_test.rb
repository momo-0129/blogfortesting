require "test_helper"

class ListArticlesTest < ActionDispatch::IntegrationTest
  def setup
    @article = Article.create(title: "title1", description: "description1")
    @article2 = Article.create(title: "title2", description: "description2")
  end

  test "should show article list" do
    get "/articles"
    assert_response :success
    assert_select "a[href=?]", article_path(@article), text: @article.title
    assert_select "a[href=?]", article_path(@article2), text: @article2.title
  end




end

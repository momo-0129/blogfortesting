require "test_helper"

class ArticleController < ActionDispatch::IntegrationTest
  setup do
    @article = Article.new(title: "title1", description: "description1")
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should show article" do
    get articles_url(@article)
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count", 1) do
      post articles_url, params: { article: { title: "title", description: "description" } }
    end

    assert_redirected_to article_url(Article.last)
  end


end
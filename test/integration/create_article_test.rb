require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest

  test "get new article form and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference "Article.count", 1 do
      post articles_path, params: { article: { title: "test", description: "test description" } }
      assert_response :redirect 
    end
    follow_redirect!
    assert_response :success
    assert_match "test", response.body
  end

  test "get new article form and reject invalid article submission" do
    get "/articles/new"
    assert_response :success
    assert_no_difference "Article.count" do
      post articles_path, params: { article: { title: " ", description: " " } }
    end
    assert_match "errors", response.body
    assert_select "h4"
  end







end

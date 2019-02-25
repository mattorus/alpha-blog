require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup    
    @user = User.create(username: "user", email: "user@example.com", password: "password")
    @article = Article.create(title: "Test Article", 
                              description: "This is a test description for the test article used to test!!",
                              user_id: @user.id )
  end

  test "article should be valid" do
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = ""
    assert_not @article.valid?
  end

  test "article should be unique" do
    @article.save
    article2 = Article.new(title: "user")
    assert_not article2.valid?
  end

  test "title should not be too long" do
    @article.title = "a" * 51
    assert_not @article.valid?
  end

  test "title should not be too short" do
    @article.title = "aa"
    assert_not @article.valid?
  end

  test "description should not be too long" do
    @article.description = "a" * 301
    assert_not @article.valid?
  end

  test "description should not be too short" do
    @article.description = "aa"
    assert_not @article.valid?
  end

end

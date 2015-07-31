require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get questions" do
    get :questions
    assert_response :success
  end

  test "should get posts" do
    get :posts
    assert_response :success
  end

end

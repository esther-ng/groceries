require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

end

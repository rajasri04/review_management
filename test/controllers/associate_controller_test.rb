require 'test_helper'

class AssociateControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get no--test-framework" do
    get :no--test-framework
    assert_response :success
  end

end

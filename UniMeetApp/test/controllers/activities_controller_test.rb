require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get activities_show_url
    assert_response :success
  end

  test "should get edit" do
    get activities_edit_url
    assert_response :success
  end

  test "should get update" do
    get activities_update_url
    assert_response :success
  end

end

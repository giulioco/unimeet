require 'test_helper'

class ActivityCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_card = activity_cards(:one)
  end

  test "should get index" do
    get activity_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_card_url
    assert_response :success
  end

  test "should create activity_card" do
    assert_difference('ActivityCard.count') do
      post activity_cards_url, params: { activity_card: { activity_id: @activity_card.activity_id } }
    end

    assert_redirected_to activity_card_url(ActivityCard.last)
  end

  test "should show activity_card" do
    get activity_card_url(@activity_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_card_url(@activity_card)
    assert_response :success
  end

  test "should update activity_card" do
    patch activity_card_url(@activity_card), params: { activity_card: { activity_id: @activity_card.activity_id } }
    assert_redirected_to activity_card_url(@activity_card)
  end

  test "should destroy activity_card" do
    assert_difference('ActivityCard.count', -1) do
      delete activity_card_url(@activity_card)
    end

    assert_redirected_to activity_cards_url
  end
end

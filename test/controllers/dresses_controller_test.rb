require 'test_helper'

class DressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dress = dresses(:one)
  end

  test "should get index" do
    get dresses_url
    assert_response :success
  end

  test "should get new" do
    get new_dress_url
    assert_response :success
  end

  test "should create dress" do
    assert_difference('Dress.count') do
      post dresses_url, params: { dress: { color: @dress.color, length: @dress.length, neckline: @dress.neckline, size: @dress.size, status: @dress.status, type: @dress.type } }
    end

    assert_redirected_to dress_url(Dress.last)
  end

  test "should show dress" do
    get dress_url(@dress)
    assert_response :success
  end

  test "should get edit" do
    get edit_dress_url(@dress)
    assert_response :success
  end

  test "should update dress" do
    patch dress_url(@dress), params: { dress: { color: @dress.color, length: @dress.length, neckline: @dress.neckline, size: @dress.size, status: @dress.status, type: @dress.type } }
    assert_redirected_to dress_url(@dress)
  end

  test "should destroy dress" do
    assert_difference('Dress.count', -1) do
      delete dress_url(@dress)
    end

    assert_redirected_to dresses_url
  end
end

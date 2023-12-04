require "test_helper"

class PostElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_element = post_elements(:one)
  end

  test "should get index" do
    get post_elements_url
    assert_response :success
  end

  test "should get new" do
    get new_post_element_url
    assert_response :success
  end

  test "should create post_element" do
    assert_difference("PostElement.count") do
      post post_elements_url, params: { post_element: { content: @post_element.content, element_type: @post_element.element_type, position: @post_element.position, post_id: @post_element.post_id } }
    end

    assert_redirected_to post_element_url(PostElement.last)
  end

  test "should show post_element" do
    get post_element_url(@post_element)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_element_url(@post_element)
    assert_response :success
  end

  test "should update post_element" do
    patch post_element_url(@post_element), params: { post_element: { content: @post_element.content, element_type: @post_element.element_type, position: @post_element.position, post_id: @post_element.post_id } }
    assert_redirected_to post_element_url(@post_element)
  end

  test "should destroy post_element" do
    assert_difference("PostElement.count", -1) do
      delete post_element_url(@post_element)
    end

    assert_redirected_to post_elements_url
  end
end

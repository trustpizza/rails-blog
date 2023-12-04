require "application_system_test_case"

class PostElementsTest < ApplicationSystemTestCase
  setup do
    @post_element = post_elements(:one)
  end

  test "visiting the index" do
    visit post_elements_url
    assert_selector "h1", text: "Post elements"
  end

  test "should create post element" do
    visit post_elements_url
    click_on "New post element"

    fill_in "Content", with: @post_element.content
    fill_in "Element type", with: @post_element.element_type
    fill_in "Position", with: @post_element.position
    fill_in "Post", with: @post_element.post_id
    click_on "Create Post element"

    assert_text "Post element was successfully created"
    click_on "Back"
  end

  test "should update Post element" do
    visit post_element_url(@post_element)
    click_on "Edit this post element", match: :first

    fill_in "Content", with: @post_element.content
    fill_in "Element type", with: @post_element.element_type
    fill_in "Position", with: @post_element.position
    fill_in "Post", with: @post_element.post_id
    click_on "Update Post element"

    assert_text "Post element was successfully updated"
    click_on "Back"
  end

  test "should destroy Post element" do
    visit post_element_url(@post_element)
    click_on "Destroy this post element", match: :first

    assert_text "Post element was successfully destroyed"
  end
end

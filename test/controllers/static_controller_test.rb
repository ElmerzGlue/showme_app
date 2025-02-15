require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Show Me Mock Trial"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end

require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "| Show Me Mock Trial"
  end

  test "should get home" do
    get static_home_url
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end

  test "should get about" do
    get static_about_url
    assert_response :success
    assert_select "title", "About #{@base_title}"
  end

  test "should get contact" do
    get static_contact_url
    assert_response :success
    assert_select "title", "Contact #{@base_title}"
  end

end

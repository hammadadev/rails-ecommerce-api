require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get registrations_signup_url
    assert_response :success
  end
end

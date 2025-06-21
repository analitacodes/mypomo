require "test_helper"

class PomodoroControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get pomodoro_start_url
    assert_response :success
  end
end

require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  # Define a user variable using the fixtures.
  def setup
    @user = users(:michael)
    remember(@user)
  end

  # Call the remember method to remember the given user.
  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  # Verify that current_user is equal to the given user.
  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end

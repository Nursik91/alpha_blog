require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(username: "nursike", email: "nursik25@mail.ru", password: "password")
  end

  test "sign up new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: @user.username, email: @user.email, password: @user.password }
    end
    assert_template 'users/show'
    assert_match @user.username, response.body
  end

end
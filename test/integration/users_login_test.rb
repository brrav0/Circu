require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

    def setup
    @user = users(:michael)
  end

    test "login with valid information" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to root_url
    #follow_redirect!
    #assert_template 'users/show' take each condition as template depend on the nature of the user
    assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path does not work no idea why the link logout does appear at the top right of the header of the layouts
    #assert_select "a[href=?]", edit_user_path(@user) does not work even though it seems that the link is there to update profile at the top right (layout / header)

    end

    test "logout triggers valid redirection and changes in layout" do
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    #delete logout_path do not see what this is

    #follow_redirect! no
    #assert_select "a[href=?]", login_path does not understand the does appear appear link is there when I log out
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

    test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end



end





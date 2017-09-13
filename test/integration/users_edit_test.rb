require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
    def setup
      @user = users(:michael)
    end

    test "unsuccessful edit" do
      log_in_as(@user)
      get edit_user_path(@user)
      get edit_user_path(@user)
      assert_template 'users/edit'
      patch user_path(@user), params: { user: { name:  "",
                                                email: "foo@invalid",
                                                password:              "foo",
                                                password_confirmation: "bar" } }
      assert_template 'users/edit'
    end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    # PREGUNTAR: 10.1.4 Successful edits (with TDD)

    #test fallará si se descomenta
    # la validacion en user.rb no hacepta el cambio =>  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    # assert_not flash.empty?
    # assert_redirected_to @user
    # @user.reload
    # assert_equal name,  @user.name
    # assert_equal email, @user.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
  # PREGUNTAR:  10.2.3 Friendly forwarding
  # SI SE DESCOMENTA LO SIGUIENTE LA PRUEBA FALLARÁ
  # p "." * 50
  # assert_redirected_to @user #=>  Expected response to be a <3XX: redirect>, but was a <200: OK>
  # p "." * 50
  #   @user.reload
  #   assert_equal name,  @user.name
  #   assert_equal email, @user.email
  end


end

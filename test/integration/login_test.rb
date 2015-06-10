require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = teachers(:one)
  end

  # test "Login" do
  #   get sessions_login_path
  #   post sessions_login_path, name: "name", email: "email", password_digest: "password"
  #   assert_response :success
  # end
  #
  # test "login and create parent" do
  #   get login_path
  #   assert_select "input[type='password']", 1
  #   post login_path, password: "iamteacher", email: "teacher@teacher.com"
  #   assert_redirected_to parents_path
  #
  #   follow_redirect!
  #   assert response.body.match("Bob the Builder")
  #   assert_select ".parent-table"
  #   number_of_parents = css_select("tbody tr").count
  #
  #   get new_parent_path
  #   assert_response :success
  #   post parents_path, parent: {name: "Ms. Smith", email: "smith@smith.com", child_name: "Lil Smith"}
  #   assert_redirected_to parents_path
  # 
  #   follow_redirect!
  #   assert response.body.match("Bob the Builder")
  #   assert response.body.match("Lil Smith")
  #   assert_equal number_of_parents+1, css_select("tbody tr").count
  #   assert_select "a[href='#{sessions_logout_path}']"
  #
  #   get sessions_logout_path
  #   assert_redirected_to sessions_login_path
  #   follow_redirect!
  #   assert_select "input[type='password']", 1
  #   assert response.body.match("Logged Out.")
  # end

end

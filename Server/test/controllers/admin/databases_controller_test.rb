require 'test_helper'

class Admin::DatabasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_database = admin_databases(:one)
  end

  test "should get index" do
    get admin_databases_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_database_url
    assert_response :success
  end

  test "should create admin_database" do
    assert_difference('Admin::Database.count') do
      post admin_databases_url, params: { admin_database: { UID: @admin_database.UID, secret: @admin_database.secret } }
    end

    assert_redirected_to admin_database_url(Admin::Database.last)
  end

  test "should show admin_database" do
    get admin_database_url(@admin_database)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_database_url(@admin_database)
    assert_response :success
  end

  test "should update admin_database" do
    patch admin_database_url(@admin_database), params: { admin_database: { UID: @admin_database.UID, secret: @admin_database.secret } }
    assert_redirected_to admin_database_url(@admin_database)
  end

  test "should destroy admin_database" do
    assert_difference('Admin::Database.count', -1) do
      delete admin_database_url(@admin_database)
    end

    assert_redirected_to admin_databases_url
  end
end

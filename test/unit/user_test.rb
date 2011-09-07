require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # setup do
  #     @user = User.new
  #   end
  
  test "User can subscribe to sites" do
    @user = users(:one)
    new_site_ids = [ sites(:cc).id, sites(:bp).id, sites(:hi).id ]
    @user.site_ids = new_site_ids
    @user.save
    @user.reload
    assert_equal @user.site_ids, new_site_ids
  end
end

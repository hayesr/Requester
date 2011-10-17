require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # setup do
  #     @user = User.new
  #   end
  
  test "User can subscribe to sites" do
    @user = users(:admin)
    # new_site_ids = [ sites(:cc).id, sites(:bp).id, sites(:hi).id ]
    @user.subscribe(sites(:cc))
    @user.subscribe(sites(:bp))
    @user.subscribe(sites(:hi))
    # @user.site_ids = new_site_ids
    @user.save
    @user.reload
    # assert_equal @user.site_ids, new_site_ids
    assert @user.sites.include?(sites(:cc))
    assert @user.sites.include?(sites(:bp))
    assert @user.sites.include?(sites(:hi))
  end
  
  test "User can be assigned needs" do
    @user = users(:staff_one)
    @user.assign(needs(:air))
    
    assert @user.needs.include?(needs(:air))
  end
end

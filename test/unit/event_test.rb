require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new
  end
  
  test "Events start in pending mode" do
    assert_equal @event.state, "pending"
  end
  
  test "Events can be approved" do
    @event.approve
    assert_equal @event.state, "approved"
  end
  
  test "Submitted event sends email to site admin" do
  end
  
  test "Submitted event sends email to staff according to need" do
  end
end

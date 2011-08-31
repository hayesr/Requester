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
  
  test "Events can be denied" do
    # Need denial message column
  end
  
  test "Events can be scoped by site" do
    @cc_events = Event.by_site sites(:cc)
    assert_equal @cc_events.first.site, sites(:cc)
    assert_not_equal @cc_events.first.site, sites(:bp)
    assert_not_equal @cc_events.first.site, sites(:mv)
  end
  
  test "Submitted event sends email to site admin" do
  end
  
  test "Submitted event sends email to staff according to need" do
  end
  
  # emails staff when approved
end

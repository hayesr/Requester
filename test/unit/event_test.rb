require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new
    @event.start_time = Time.now
    @event.end_time = @event.start_time + 3.day + 2.hours
    @event.site = sites(:cc)
    
  end
  
  test "Events start in pending mode" do
    assert_equal @event.state, "pending"
  end
  
  test "Events can be approved" do
    @event.approve
    assert_equal "approved", @event.state
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
  
  test "Event end date gets set to the start date" do
    @event.save
    assert_equal @event.end_time.day, @event.start_time.day, "Days not equal"
    assert_equal @event.end_time.month, @event.start_time.month, "Months not equal"
  end
  
  test "Submitted event sends email to site admin" do
  end
  
  test "Submitted event sends email to staff according to need" do
  end
  
  # emails staff when approved
end

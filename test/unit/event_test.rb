require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new
    @future_pending  = events(:future_pending)
    @future_approved = events(:future_approved)
    @past_pending    = events(:past_pending)
    @past_approved   = events(:past_approved)
    
    
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
    puts @future_pending.site.name
  end
  
  test "Submitted event sends email to site admin" do
  end
  
  test "Submitted event sends email to staff according to need" do
  end
  
  # emails staff when approved
end

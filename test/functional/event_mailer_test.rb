require 'test_helper'

class EventMailerTest < ActionMailer::TestCase
  setup do
    @event = events(:future_approved)
    ActionMailer::Base.deliveries.clear
  end
  
  test "Mailing happens" do
    EventMailer.confirmation_email(@event).deliver
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
end

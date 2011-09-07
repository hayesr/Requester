require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  include Capybara::DSL
  
  test "Visitors are sent to the new event form" do
    visit "/"
    assert_match "New event", page.body
  end
  
  test "Visitors cannot get to pending events" do
    visit "/events/pending/cc"
    assert_match "You need to sign in or sign up before continuing", page.body
  end
end
require 'test_helper'

class MailingTest < ActiveSupport::TestCase
  include Capybara::DSL
  
  # This might have worked except couldn't test has_many :through assoc.
  
  # test "Appropriate users get an email" do
  #   t = Time.now
  #   start_day = rand(t.end_of_month.day - t.day) + t.day
  #   visit "/"
  #   
  #   random_string = Digest::SHA1.hexdigest(Time.now.to_s)[0..8]
  #   
  #   fill_in( 'event[requester]', :with => "Mr #{random_string}")
  #   fill_in( 'event[requester_email]', :with => "#{random_string}@example.com")
  #   fill_in( 'event[title]', :with => "Test #{random_string}")
  #   select( 'Cedarcreek', :from => 'event[site_id]')
  #   
  #   # fill_out 'date' with today plus random days
  #   # _1i => year
  #   # _2i => month
  #   # _3i => day
  #   # _4i => hour
  #   # _5i => minute
  #   select 'November', :from => 'event[start_time(2i)]'
  #   select start_day.to_s, :from => 'event[start_time(3i)]'
  #   select '2011', :from => 'event[start_time(1i)]'
  #   # start time
  #   select '04 PM', :from => 'event[start_time(4i)]'
  #   select '30', :from => 'event[start_time(5i)]'
  #   
  #   # end time
  #   select '06 PM', :from => 'event[end_time(4i)]'
  #   select '00', :from => 'event[end_time(5i)]'
  #   
  #   fill_in 'event[area]', :with => 'MPR'
  #   
  #   check 'Lights'
  #   check 'Custodial'
  #   
  #   click_on 'Submit'
  # end
  
end
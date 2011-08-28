class Event < ActiveRecord::Base
  
  has_and_belongs_to_many :needs
  
  state_machine :state, :initial => :pending do
    event :approve do
      transition :pending => :approved
    end
  end
  
  def initialize
    super()
  end
  
  def fdate
    date.strftime("%A, %b %d") unless date.nil?
  end
  
  def ftime(time)
    if time == 'start'
      start_time.strftime("%l:%M %p") unless start_time.nil?
    else
      end_time.strftime("%l:%M %p") unless end_time.nil?
    end
  end
  
end

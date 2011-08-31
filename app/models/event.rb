class Event < ActiveRecord::Base
  belongs_to :site
  has_and_belongs_to_many :needs
  
  # TODO attr_accessible protect state
  
  state_machine :state, :initial => :pending do
    event :approve do
      transition :pending => :approved
    end
  end
  
  def fdate
    start_time.strftime("%A, %b %d") unless date.nil?
  end
  
  def fstart
    start_time.strftime("%l:%M %p") unless start_time.nil?
  end
  
  def fend
    end_time.strftime("%l:%M %p") unless end_time.nil?
  end
  
end

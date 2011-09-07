class Event < ActiveRecord::Base
  belongs_to :site
  has_and_belongs_to_many :needs
  
  # TODO attr_accessible protect state
  
  state_machine :state, :initial => :pending do
    event :approve do
      transition [:pending, :denied] => :approved
    end
    
    event :deny do
      transition [:pending, :approved] => :denied
    end
  end
  
  def fdate
    start_time.strftime("%b %e %Y") unless start_time.nil?
  end
  
  def fstart
    start_time.strftime("%l:%M %p") unless start_time.nil?
  end
  
  def fend
    end_time.strftime("%l:%M %p") unless end_time.nil?
  end
  
  def self.by_site(site)
    where(:site_id => site)
  end
  
  def self.pending
    where(:state => 'pending')
  end
  
  def self.approved
    where(:state => 'approved')
  end
  
end

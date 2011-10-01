class Event < ActiveRecord::Base
  belongs_to :site
  has_and_belongs_to_many :needs
  
  validates_presence_of :start_time, :end_time, :site
    
  before_save :set_endtime_date_to_starttime_date
  
  # TODO attr_accessible protect state
  
  #attr_accessor :start_hour, :start_minute, :end_hour, :end_minute
  
  state_machine :state, :initial => :pending do
    event :approve do
      transition [:pending, :denied] => :approved
    end
    
    event :deny do
      transition [:pending, :approved] => :denied
    end
  end
  
  # scope by site, accepts int or array
  def self.by_site(site)
    where(:site_id => site)
  end
  
  def self.pending
    where(:state => 'pending')
  end
  
  def self.approved
    where(:state => 'approved')
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
  
  protected
  
  def set_endtime_date_to_starttime_date
    s = self.start_time.in_time_zone(Time.zone)
    e = self.end_time.in_time_zone(Time.zone)
    self.end_time = DateTime.new(s.year, s.month, s.day, e.hour, e.min, e.sec, s.zone)
  end
  
  
  
end

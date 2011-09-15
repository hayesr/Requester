class Hour
  attr_accessor :id
  
  def initialize(id=0)
    @id = id
  end
  
  def self.all
    (0..23).map { |h| new(h) }
  end
  
  def humanize
    #ampm_hour = (id == 0) ? 12 : (id == 12) ? 12 : (id / 12 == 1 ? id % 12 : id)
    
    if( id == 0 || id == 12)
      _hour = 12
    elsif( id / 12 == 1 )
      # this is integers remember? So 16 / 12 == 1, this also filters out n < 12
      # => the remainder of 16 / 12 is 4
      _hour = id % 12
    else
      _hour = id
    end
    
    meridian = (id <= 11) ? 'AM' : 'PM'
    "#{_hour} #{meridian}"
  end
end
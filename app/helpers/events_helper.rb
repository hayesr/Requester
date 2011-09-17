module EventsHelper
  def startoptions
    {
      :ampm => true, 
      :start_year => 2011, 
      :end_year => 2012,
      :order => [:month,:day,:year]
    }
  end
  
  def endoptions
    {
      :ampm => true, 
      :discard_year => true, 
      :discard_month => true,
      :start_year => 2011, 
      :end_year => 2012
    }
  end
  
  def configured_select_hour(initial, field_pre)
    options = {
      :ampm => true, 
      :prefix => "event",
      :field_name => "#{field_pre}_time(4i)",
      :start_hour => 7,
      :end_hour => 20
    }
    select_hour initial, options
    
  end
  
  def configured_select_minute(initial, field_pre)
    select_minute Time.now, :prefix => "event", :minute_step => 15, :field_name => "#{field_pre}_time(5i)"
  end
  
  
end

module ActionView
  module Helpers
    class DateTimeSelector
      
      def select_hour
        if @options[:use_hidden] || @options[:discard_hour]
          build_hidden(:hour, hour)
        else
          # start_hour = @options[:start_hour] || 0
          # end_hour = @options[:end_hour] || 23
          
          build_options_and_select(:hour, hour, { :end => @options[:end_hour], :start => @options[:start_hour], :ampm => @options[:ampm] } )
        end
      end
      
    end
  end
end
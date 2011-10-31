class EventMailer < ActionMailer::Base
  default from: "donotreply@saugususd.org"
  
  def confirmation_email(event)
    @event = event
    mail(:to => event.requester_email, :subject => "Your request has been received.")
  end
  
  def approval_notice(event)
    @event = event
    @event.site.users.each do |user|
      mail(:to => user.email, :subject => "A new facilities request requires your attention")
    end
    
  end
  
  def staff_notice(event)
    @event = event
    @needs = @event.needs
    users = @needs.collect(&:users)
    addrs = users.collect{|u| u.first.email } # => u is a relation object
    mail(:to => addrs, :subject => "A new facilities request requires your attention")
  end
  
  def approved_notice(event)
    @event = event
    mail(:to => event.requester_email, :subject => "Your request has been approved.")
  end
  
  def denied_notice(event)
    @event = event
    mail(:to => event.requester_email, :subject => "Your request has been denied.")
  end
  
end

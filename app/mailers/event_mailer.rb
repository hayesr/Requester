class EventMailer < ActionMailer::Base
  default from: "donotreply@saugususd.org"
  
  def confirmation_email(event)
    @event = event
    mail(:to => event.requester, :subject => "Your request has been received.")
  end
end

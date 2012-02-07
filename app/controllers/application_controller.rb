class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    events_path
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_event_path
  end
end

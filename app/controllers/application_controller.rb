class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :find_the_current_tenant
  before_filter :authenticate_user!


  def find_the_current_tenant
    if current_user
      set_current_tenant(current_user.client)
    else
      set_current_tenant(nil)
    end
      
  end  
end

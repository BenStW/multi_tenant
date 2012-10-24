class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :find_the_current_tenant
  before_filter :authenticate_user!


  # before_filter :authenticate_tenant!
   
 # def authenticate_tenant!
 #   puts params.to_yaml
 #   if params[:user] and params[:user][:email]
 #      user = User.unscoped.find_by_email(params[:user][:email])
 #      puts "CLIENT: #{user.client}"
 #      set_current_tenant(user.client)
 #   end
 #   unless authenticate_user!
 #        flash[:notice] = "NOPE!!!"
 #        return false
 #   end
 #   set_current_tenant(current_user.client)
 #   true
 # end
 # 

  def find_the_current_tenant
#    debugger
    if current_user
      #ActsAsTenant.current_tenant(current_user.client)
      set_current_tenant(current_user.client)
    else
      set_current_tenant(nil)
    end
      
  end  
end

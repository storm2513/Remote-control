class ApplicationController < ActionController::Base
	around_action :set_time_zone
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

   private

   def set_time_zone
     Time.use_zone(3) { yield }
   end
end

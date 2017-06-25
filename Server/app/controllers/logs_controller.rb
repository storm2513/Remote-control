class LogsController < ApplicationController
	def index
		@logs = Log.where(user_id: current_user.id).sort.reverse
	end

	def destroy
		Log.where(user_id: current_user.id).destroy_all
		redirect_to root_path
	end
end

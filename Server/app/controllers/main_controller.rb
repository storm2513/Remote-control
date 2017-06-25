class MainController < ApplicationController
	before_action :authenticate_user!

	def index
		@devices = Device.where(user_id: current_user.id).sort
	end
end

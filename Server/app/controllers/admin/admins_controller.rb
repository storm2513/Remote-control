class Admin::AdminsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@devices = Device.all.sort
	end
end

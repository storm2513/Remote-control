class Admin::LogsController < ApplicationController
	def index
		@logs = Log.all.sort.reverse
	end
end

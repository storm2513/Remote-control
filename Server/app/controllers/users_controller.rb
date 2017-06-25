class UsersController < ApplicationController
	def show
		@user = User.first
	end
	def activate

	end
end

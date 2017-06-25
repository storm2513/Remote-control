class Api::UsersController < ApplicationController
	def index
		respond_to { |format|
		  format.json { render :json => User.all.to_json(:include => [{:devices => {:except => [:secret, :created_at, :updated_at]}} , :logs], :except => [:created_at, :updated_at, :device_id]) }
		}
	end
	def show
		@user = User.find(params[:id])
		respond_to { |format|
		  format.json { render :json => @user.to_json(:include => [{:devices => {:except => [:secret, :created_at, :updated_at]}} , :logs], :except => [:created_at, :updated_at, :device_id]) }
		}
	end
end

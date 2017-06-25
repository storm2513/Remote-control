class Api::DevicesController < ApplicationController
	def index
		respond_to { |format|
		  format.json { render :json => Device.all.to_json(:except => [:secret, :created_at, :updated_at, :id, :name, :user_id]) }
		}
	end
	def show
		@device = Device.where(UID: params[:id])
		puts @device
		respond_to { |format|
		  format.json { render :json => @device.to_json(:except => [:secret, :created_at, :updated_at, :id, :name, :user_id]) }
		}
	end
end

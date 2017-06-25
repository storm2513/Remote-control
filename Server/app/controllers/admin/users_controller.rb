class Admin::UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all.sort
	end

	def show
	end

	def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'Пользователь был успшено удалён.' }
      format.json { head :no_content }
    end
  end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
      redirect_to admin_users_path if @user.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :name, :email, :devices)
    end
end

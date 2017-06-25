class Admin::DatabasesController < ApplicationController
  before_action :set_database, only: [:show, :edit, :update, :destroy]

  # GET /admin/databases
  # GET /admin/databases.json
  def index
    @databases = Database.all
  end

  # GET /admin/databases/1
  # GET /admin/databases/1.json
  def show
  end

  # GET /admin/databases/new
  def new
    @database = Database.new
  end

  # GET /admin/databases/1/edit
  def edit
  end

  # POST /admin/databases
  # POST /admin/databases.json
  def create
    puts database_params
    @database = Database.new(database_params)

    respond_to do |format|
      if @database.save
        format.html { redirect_to admin_database_path(@database), notice: 'Данные для устройства были успешно созданы' }
        format.json { render :show, status: :created, location: @database }
      else
        format.html { render :new }
        format.json { render json: @database.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/databases/1
  # PATCH/PUT /admin/databases/1.json
  def update
    respond_to do |format|
      if @database.update(database_params)
        format.html { redirect_to admin_database_path(@database), notice: 'Данные были успешно обновлены' }
        format.json { render :show, status: :ok, location: @database }
      else
        format.html { render :edit }
        format.json { render json: @database.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/databases/1
  # DELETE /admin/databases/1.json
  def destroy
    @database.destroy
    respond_to do |format|
      format.html { redirect_to admin_databases_path, notice: 'Устройство было успешно удалено из базы данных' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_database
      @database = Database.find_by_id(params[:id])
      redirect_to admin_databases_path if @database.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def database_params
      params.require(:database).permit(:UID, :secret)
    end
end

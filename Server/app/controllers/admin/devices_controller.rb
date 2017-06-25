class Admin::DevicesController < ApplicationController
	before_action :set_device, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all.sort
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  def change
    puts params
    @device = Device.find(params[:id])
    if params["intent"] == "child"
      if @device.active.zero?
        @device.active = 1
        Log.make("Устройство #{@device.name} с ID #{@device.UID} стало 'Active'", @device.user.id)
      else
        @device.active = 0
        Log.make("Устройство #{@device.name} с ID #{@device.UID} стало 'Disabled'", @device.user.id)
      end
    end
    if params["intent"] == "status"
      if @device.status.zero?
        @device.status = 1
        Log.make("Устройство #{@device.name} с ID #{@device.UID} было включено", @device.user.id)
      else
        @device.status = 0
        Log.make("Устройство #{@device.name} с ID #{@device.UID} было выключено", @device.user.id)
      end
    end
    if @device.save(validate: false)
      render json: {}, status: 200
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    init = device_params
    init["status"] = 0
    init["active"] = 0
    @device = Device.new(init)
    respond_to do |format|
      if @device.save
        format.html { redirect_to admin_device_path(@device), notice: 'Устройство было успешно добавлено.' }
        format.json { render :show, status: :created, location: @device }
        Log.make("Устройство #{@device.name} с ID #{@device.UID} было успешно добавлено", @device.user_id)
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      @device.skip_secret_validation = true
      if @device.update(device_params)
        format.html { redirect_to admin_device_path(@device), notice: 'Устройство было успешно изменено.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
    Log.make("Устройство #{@device.name} с ID #{@device.UID} было изменено", @device.user.id)
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    Log.make("Устройство #{@device.name} с ID #{@device.UID} было удалено", @device.user.id)
    @device.destroy
    respond_to do |format|
      format.html { redirect_to admin_devices_url, notice: 'Устройство было успшено удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find_by_id(params[:id])
      redirect_to admin_devices_path if @device.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:user_id, :name, :UID, :status, :active, :secret)
    end
end

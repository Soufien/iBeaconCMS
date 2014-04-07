class BeaconDevicesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_beacon_device, only: [:show, :edit, :update, :destroy]

  # GET /beacon_devices
  # GET /beacon_devices.json
  def index
    @beacon_devices = BeaconDevice.all
  end

  # GET /beacon_devices/1
  # GET /beacon_devices/1.json
  def show
  end

  # GET /beacon_devices/new
  def new
    @beacon_device = BeaconDevice.new
  end

  # GET /beacon_devices/1/edit
  def edit
  end

  # POST /beacon_devices
  # POST /beacon_devices.json
  def create
    @beacon_device = BeaconDevice.new(beacon_device_params)

    respond_to do |format|
      if @beacon_device.save
        format.html { redirect_to @beacon_device, notice: 'Beacon device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @beacon_device }
      else
        format.html { render action: 'new' }
        format.json { render json: @beacon_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beacon_devices/1
  # PATCH/PUT /beacon_devices/1.json
  def update
    respond_to do |format|
      if @beacon_device.update(beacon_device_params)
        format.html { redirect_to @beacon_device, notice: 'Beacon device was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @beacon_device }
      else
        format.html { render action: 'edit' }
        format.json { render json: @beacon_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beacon_devices/1
  # DELETE /beacon_devices/1.json
  def destroy
    @beacon_device.destroy
    respond_to do |format|
      format.html { redirect_to beacon_devices_url }
      format.json { head :no_content }
    end
  end


  # TODO: the webservices should really get the user_id from the client
  # these 2 webservices are if the device_id wants to be passed instead
  # :device_id, :beacon_id
  def add_device_to_beacon_range
    user = User.find_by_device_id(params[:device_id])
    if user.nil?
      respond_to do |format|
        format.json { render json: {:ok => false, :message => "no user found for device id: #{params[:device_id]}"}, status: :unprocessable_entity }
      end
    else
      @beacon_device = BeaconDevice.find_by_beacon_id_and_user_id(params[:beacon_id], user.id)
      if @beacon_device
        respond_to do |format|
          format.json { render json: {:ok => false, :message => "already associated user #{user.id} to beacon #{params[:beacon_id]}"}, status: :unprocessable_entity }
        end
      else
        @beacon_device = BeaconDevice.new(:user_id => user.id, :beacon_id => params[:beacon_id])
        respond_to do |format|
          if @beacon_device.save
            format.json { render action: 'show', status: :created, location: @beacon_device }
          else
            format.json { render json: @beacon_device.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # :device_id, :beacon_id
  def remove_device_from_beacon_range
    user = User.find_by_device_id(params[:device_id])
    if user.nil?
      respond_to do |format|
        format.json { render json: {:ok => false, :message => "no user found for device id: #{params[:device_id]}"}, status: :unprocessable_entity }
      end
    else
      @beacon_device = BeaconDevice.find_by_beacon_id_and_user_id(params[:beacon_id], user.id)
      if (@beacon_device)
        @beacon_device.destroy
        respond_to do |format|
          format.json { render json: {:ok => true, :message => "removed beacon_device with params: user_id =  #{user.id}, beacon_id = #{params[:beacon_id]}"}, status: :unprocessable_entity }
        end
      else
        respond_to do |format|
          format.json { render json: {:ok => false, :message => "no beacon found for params: user_id = #{user.id}, beacon_id = #{params[:beacon_id]}"}, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beacon_device
      @beacon_device = BeaconDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beacon_device_params
      params.require(:beacon_device).permit(:user_id, :beacon_id)
    end
end

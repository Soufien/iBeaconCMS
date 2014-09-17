class DetectionsController < ApplicationController
  #before_filter :authenticate_user!

  protect_from_forgery :except => :create

  before_action :set_detection, only: [:show, :edit, :update, :destroy]
  before_action :detection_beacon, only: [:create]

  skip_before_action :authenticate_user!, only: [:create]

  # GET /detections
  def index

    respond_to do |format|
      @detections =Detection.joins("INNER JOIN users ON users.uid = detections.user_uid").select("detections.*,users.email")
      format.html
      format.csv {send_data @detections.to_csv}
    end
  end

  # GET /detections/1
  def show
  end

  # GET /detections/new
  def new
    @detection = Detection.new
  end

  # GET /detections/1/edit
  def edit
  end

  # POST /detections
  def create
    
    @detection = Detection.new(detection_params)

    beacon = Beacon.where(params[:beacon]).first
    @detection.beacon = beacon

    if @detection.save
      render json: @detection
    else
      render json: { :errors => @detection.errors}
    end
  end

  # PATCH/PUT /detections/1
  def update
    if @detection.update(detection_params)
      redirect_to @detection, notice: 'Detection was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /detections/1
  def destroy
    @detection.destroy
    redirect_to detections_url, notice: 'Detection was successfully destroyed.'
  end


  # Added to handle multiple detection creations

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_detection
    @detection = Detection.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def detection_params
    params.require(:detection).permit(:beacon_id, :user_id, :user_uid, :accuracy, :proximity, :rssi, :created_at, :updated_at)
  end

  def detection_beacon
    params.require(:beacon).permit(:uuid, :major, :minor)
  end



  end

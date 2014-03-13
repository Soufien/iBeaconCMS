class DetectionsController < ApplicationController
  before_action :set_detection, only: [:show, :edit, :update, :destroy]

  # GET /detections
  def index
    @detections = Detection.all
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

    if @detection.save
      redirect_to @detection, notice: 'Detection was successfully created.'
    else
      render action: 'new'
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detection
      @detection = Detection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def detection_params
      params.require(:detection).permit(:beacon_id, :user_id, :accuracy, :proximity, :rssi)
    end
end

require "urbanairship"

class NotificationsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)
    #get item content associated with the beacon
    begin
      html_content = Beacon.find(params[:beacon_id]).item.content.html_safe
      @notification.content = html_content
    rescue
      puts "No html content associated to the beacon: #{params[:beacon_id]}"
    end
    response = Urbanairship.push_rich_notification(params[:device_id], params[:os], html_content)

    respond_to do |format|
      if @notification.save && response && response["ok"]
        #format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @notification }
        format.json { render json: response, status: :created, location: @notification }
      else
        #format.html { render action: 'new' }
        #format.json { render json: @notification.errors, status: :unprocessable_entity }
        format.json { render json: response, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @notification }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:device_id, :os, :beacon_id, :content)
    end
end

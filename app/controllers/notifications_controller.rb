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
      beacon_item = Beacon.find(params[:beacon_id]).item
      if (params[:is_goodbye_content])
        html_content = beacon_item.goodbye_content.html_safe
      else
        html_content = beacon_item.content.html_safe
      end
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

  # beacon_id, html_content
  def broadcast_notification
    users = BeaconDevice.where(:beacon_id => params[:beacon_id])
    error = false
    message = ""
    error_num = 0
    users.each do |user|
      user = User.find(user.user_id)
      params[:notification][:device_id] = user.device_id
      params[:notification][:os] = user.os
      response = Urbanairship.push_rich_notification(user.device_id, user.os, params[:content])
      puts response
      if (response && response["ok"])
        notification = Notification.new(notification_params)
        notification.save!
      else
        error = true
        error_num = error_num + 1
        message += "error #" + error_num.to_s + ":" + response["details"]["error"] + ", "
      end
    end
    message = "notifications sent to all the devices near beacon: #{params[:beacon_id]}" unless (error == true)
    respond_to do |format|
      format.json { render json: {:ok => !error, :message => message}}
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

class TemplatePhotosController < ApplicationController
  before_action :set_template_photo, only: [:show, :edit, :update, :destroy]

  # GET /template_photos
  # GET /template_photos.json
  def index
    @template_photos = TemplatePhoto.all
  end

  # GET /template_photos/1
  # GET /template_photos/1.json
  def show
  end

  # GET /template_photos/new
  def new
    @template_photo = TemplatePhoto.new
  end

  # GET /template_photos/1/edit
  def edit
  end

  # POST /template_photos
  # POST /template_photos.json
  def create
    @template_photo = TemplatePhoto.new(template_photo_params)

    respond_to do |format|
      if @template_photo.save
        format.html { redirect_to @template_photo, notice: 'Template photo was successfully created.' }
        format.json { render :show, status: :created, location: @template_photo }
      else
        format.html { render :new }
        format.json { render json: @template_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template_photos/1
  # PATCH/PUT /template_photos/1.json
  def update
    respond_to do |format|
      if @template_photo.update(template_photo_params)
        format.html { redirect_to @template_photo, notice: 'Template photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @template_photo }
      else
        format.html { render :edit }
        format.json { render json: @template_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_photos/1
  # DELETE /template_photos/1.json
  def destroy
    @template_photo.destroy
    respond_to do |format|
      format.html { redirect_to template_photos_url, notice: 'Template photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_photo
      @template_photo = TemplatePhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_photo_params
      params[:template_photo].permit(:name, :description, :title ,:photolink ,:url_image_1,:remove_url_image_1, :item_id)
    end
end

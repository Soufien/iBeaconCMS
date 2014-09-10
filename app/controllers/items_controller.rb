class ItemsController < ApplicationController
  #before_filter :authenticate_user!

  before_action :set_item, only: [:show, :edit, :update, :destroy, :embedded, :kiosk]

  # GET /items
  def index
    @items = Item.all
    @templates = Template.all
    @template_photos = TemplatePhoto.all
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
    if (@item.name == 'Template1')
      @item.template_photo = TemplatePhoto.new
    elsif (@item.name == 'Template2')
      @item.template = Template.new
    else
      @item.template_photo = TemplatePhoto.new
      @item.template = Template.new
    end

  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /items/1
  def destroy
    @template = Template.find(@item.template)
    @template_photo = TemplatePhoto.find(@item.template_photo)
    @template.destroy
    @template_photo.destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end


  # Get /items/1/embedded
  # Used by mobile app to display item content
  def embedded
    render layout: 'compact'
  end

  # Get /items/1/kiosk
  # Used by mobile app to display item video
  def kiosk
    render layout: 'compact'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:spec,
                                   :name,
                                   :description,
                                   :beacon_id,
                                   :content,
                                   :template_id,
                                   :show_after_seconds,
                                   template_attributes:[:id,:name,:description_1,:photo_link_1,:url_image_1,:item_id],
                                   template_photo_attributes:[:id,:name,:title,:description,:photolink,:url_image_1,:item_id])
    end


    def resolve_layout
      case action_name
        when 'embedded'
          'compact'
        else
          'application'
      end
    end
end

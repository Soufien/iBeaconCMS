class ItemsController < ApplicationController
  #before_filter :authenticate_user!

  before_action :set_item, only: [:show, :edit, :update, :destroy, :embedded, :kiosk]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
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
      params.require(:item).permit(:spec, :name, :description, :beacon_id, :content, :template_id, :goodbye_content, :video, :show_after_seconds)
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

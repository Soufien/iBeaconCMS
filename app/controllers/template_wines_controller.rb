class TemplateWinesController < ApplicationController
  before_action :set_template_wine, only: [:show, :edit, :update, :destroy]

  # GET /template_wines
  # GET /template_wines.json
  def index
    @template_wines = TemplateWine.all
  end

  # GET /template_wines/1
  # GET /template_wines/1.json
  def show
  end

  # GET /template_wines/new
  def new
    @template_wine = TemplateWine.new
  end

  # GET /template_wines/1/edit
  def edit
  end

  # POST /template_wines
  # POST /template_wines.json
  def create
    @template_wine = TemplateWine.new(template_wine_params)

    respond_to do |format|
      if @template_wine.save
        format.html { redirect_to @template_wine, notice: 'Template wine was successfully created.' }
        format.json { render :show, status: :created, location: @template_wine }
      else
        format.html { render :new }
        format.json { render json: @template_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template_wines/1
  # PATCH/PUT /template_wines/1.json
  def update
    respond_to do |format|
      if @template_wine.update(template_wine_params)
        format.html { redirect_to @template_wine, notice: 'Template wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @template_wine }
      else
        format.html { render :edit }
        format.json { render json: @template_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_wines/1
  # DELETE /template_wines/1.json
  def destroy
    @template_wine.destroy
    respond_to do |format|
      format.html { redirect_to template_wines_url, notice: 'Template wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_wine
      @template_wine = TemplateWine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_wine_params
      params[:template_wine].permit(:name, :taste_notes, :price ,:wine_specs_vintage,:wine_specs_sugar,:wine_specs_appellation, :wine_specs_acid , :wine_specs_alcohol, :wine_specs_ph, :photo_link, :wine_specs_price_description, :item_id)
    end
end

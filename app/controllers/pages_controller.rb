class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all.where(:magazine_id=> params[:magazine_id]).order("page_number asc")
    @magazine =  Magazine.find(params[:magazine_id])
  end

  def all_pages
    @pages = Page.all.where(:magazine_id=> params[:magazine_id]).order("page_number asc")
    @magazine =  Magazine.find(params[:magazine_id])
  end

  def inactive_pages
    @pages = Page.all.where(:magazine_id=> params[:magazine_id], :status=> false).order("page_number asc")
    @magazine =  Magazine.find(params[:magazine_id])
  end

  def active_pages
    @pages = Page.all.where(:magazine_id=> params[:magazine_id], :status=> true).order("page_number asc")
    @magazine =  Magazine.find(params[:magazine_id])
  end

  def clone

    @magazine =  Magazine.find(params[:magazine_id])
    page = Page.find(params[:page_id])
    @pages = page.dup

    respond_to do |format|
      format.html { render action: 'clone', notice: 'Agreement was successfully cloned.' }
    end
  end

  def movepage

    @magazine =  Magazine.find(params[:magazine_id])
    movepage = Page.find(params[:page_id])
    @pages = movepage.clone

    respond_to do |format|
      format.html { render action: 'movepage', notice: 'Agreement was successfully cloned.' }
    end
  end


  def toggle_approve
    @pages = Page.find(params[:id])
    @pages.toggle!(:status)
    respond_to do |format|
      format.js
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @magazine =  Magazine.find(params[:magazine_id])
  end

  # GET /pages/new
  def new
    @magazine =  Magazine.find(params[:magazine_id])
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit

  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to all_pages_path(:magazine_id=>@page.magazine_id), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end

    @coordinates = Coordinate.new
    @coordinates.page_id = @page.id
    @coordinates.product_name = 'Hidden Coordinates'
    @coordinates.coordinates='0, 0, -1, 0, -1, -2, 0, -2'
    @coordinates.barcode='999999999999'
    @coordinates.product_id='999999999999'
    @coordinates.site_link=' '
    @coordinates.save

  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to all_pages_path(:magazine_id=>@page.magazine_id), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to all_pages_path(:magazine_id=>@page.magazine_id), notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:magazine_id, :page_number, :image, :status)
    end
end

class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.rank(:row_order).all.where(:merchant_id=> nil).page(params[:page]).per(20)
  end

  def update_row_order
    @banners = Banner.find(banner_params[:banner_id])
    @banners.row_order_position = banner_params[:row_order_position]
    @banners.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end


  def toggle_approve
    @banners = Banner.find(params[:id])
    @banners.toggle!(:status)
    respond_to do |format|
      format.js
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
  end

  # GET /banners/new
  def new
    @banner = Banner.new
  end

  # GET /banners/1/edit
  def edit
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to banners_url, notice: 'Banner was successfully created.' }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banners/1
  # PATCH/PUT /banners/1.json
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to banners_url, notice: 'Banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    if @banner.status == false
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to banners_url, notice: 'Banner was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
      respond_to do |format|
        format.html { redirect_to banners_url, notice: 'Banner is Active, You cant delete.' }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banner_params
      params.require(:banner).permit(:banner_id,:name, :image , :status , :row_order_position ,:start_date ,:end_date , :site_link)
    end
end

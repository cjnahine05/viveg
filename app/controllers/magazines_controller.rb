class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /magazines
  # GET /magazines.json
  def index
    @active_magazines_mechants = Magazine.rank(:row_order).all.where(status: true,:merchant_id=> nil).page(params[:page]).per(20)
    @inactive_magazines_mechants = Magazine.rank(:row_order).all.where(status: false,:merchant_id=> nil).page(params[:page]).per(20)
  end

  def update_row_order
    @magazines = Magazine.find(magazine_params[:magazine_id])
    @magazines.row_order_position = magazine_params[:row_order_position]
    @magazines.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end


  def toggle_approve
    @magazines = Magazine.find(params[:id])
    @magazines.toggle!(:status)
    respond_to do |format|
      format.js
    end
  end
  def all_magazine
    @magazines = Magazine.rank(:row_order).all.where(:merchant_id=> nil).page(params[:page]).per(20)
    @magazines_mechants = Magazine.rank(:row_order).all.where.not(:merchant_id=> nil).page(params[:page]).per(20)
    @active_magazines_mechants = Magazine.rank(:row_order).all.where.not(status: false,:merchant_id=> nil).page(params[:page]).per(20)
    @inactive_magazines_mechants = Magazine.rank(:row_order).all.where.not(status: true,:merchant_id=> nil).page(params[:page]).per(20)

  end
  def inactive_magazine
    @magazines = Magazine.rank(:row_order).all.where( status: false, merchant_id: nil ).page(params[:page]).per(20)

  end
  def active_magazine
    @magazines = Magazine.rank(:row_order).all.where( status: true, merchant_id: nil ).page(params[:page]).per(20)
  end

  # GET /magazines/1
  # GET /magazines/1.json
  def show
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end

  # GET /magazines/1/edit
  def edit
  end

  # POST /magazines
  # POST /magazines.json
  def create
    @magazine = Magazine.new(magazine_params)

    respond_to do |format|
      if @magazine.save
        format.html { redirect_to all_magazine_url, notice: 'Magazine was successfully created.' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :new }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazines/1
  # PATCH/PUT /magazines/1.json
  def update

    if @magazine.merchant_id == nil

    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to "#{all_magazine_url}#all_admin_magazine", notice: 'Magazine was successfully updated.' }
        format.json { render :show, status: :ok, location: @magazine }
      else
        format.html { render :edit }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end

    elsif @magazine.merchant_id.present?
      respond_to do |format|
        if @magazine.update(magazine_params)
          format.html { redirect_to "#{all_magazine_url}#all_merchants_magazine", notice: 'Magazine was successfully updated.' }
          format.json { render :show, status: :ok, location: @magazine }
        else
          format.html { render :edit }
          format.json { render json: @magazine.errors, status: :unprocessable_entity }
        end
      end

    end

  end

  # DELETE /magazines/1
  # DELETE /magazines/1.json
  def destroy
    if @magazine.merchant_id == nil

    @magazine = Magazine.find(params[:id])
    if @magazine.status == true
      respond_to do |format|
        format.html { redirect_to  "#{all_magazine_url}#all_admin_magazine", notice: 'Magazine is Active, You cant delete.' }
      end
    else
    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to  "#{all_magazine_url}#all_admin_magazine", notice: 'Magazine was successfully destroyed.' }
      format.json { head :no_content }
    end
    end
    elsif @magazine.merchant_id.present?
      @magazine = Magazine.find(params[:id])
      if @magazine.status == true
        respond_to do |format|
          format.html { redirect_to "#{all_magazine_url}#all_merchants_magazine", notice: 'Magazine is Active, You cant delete.' }
        end
      else
        @magazine.destroy
        respond_to do |format|
          format.html { redirect_to "#{all_magazine_url}#all_merchants_magazine", notice: 'Magazine was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:magazine_id,:name ,:image ,:start_date ,:end_date ,:title, :category, :bar_code, :month, :year , :status,:row_order_position)
    end
end

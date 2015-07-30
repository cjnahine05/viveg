class SplashscreensController < ApplicationController
  before_action :set_splashscreen, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /splashscreens
  # GET /splashscreens.json
  def index
    @splashscreens = Splashscreen.all
  end

  # GET /splashscreens/1
  # GET /splashscreens/1.json
  def show
  end

  # GET /splashscreens/new
  def new
    @splashscreen = Splashscreen.new
  end

  # GET /splashscreens/1/edit
  def edit
  end

  # POST /splashscreens
  # POST /splashscreens.json
  def create
    @splashscreen = Splashscreen.new(splashscreen_params)

    respond_to do |format|
      if @splashscreen.save
        format.html { redirect_to splashscreens_url, notice: 'Splashscreen was successfully created.' }
        format.json { render :show, status: :created, location: @splashscreen }
      else
        format.html { render :new }
        format.json { render json: @splashscreen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /splashscreens/1
  # PATCH/PUT /splashscreens/1.json
  def update
    respond_to do |format|
      if @splashscreen.update(splashscreen_params)
        format.html { redirect_to splashscreens_url, notice: 'Splashscreen was successfully updated.' }
        format.json { render :show, status: :ok, location: @splashscreen }
      else
        format.html { render :edit }
        format.json { render json: @splashscreen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /splashscreens/1
  # DELETE /splashscreens/1.json
  def destroy
    @splashscreen.destroy
    respond_to do |format|
      format.html { redirect_to splashscreens_url, notice: 'Splashscreen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_splashscreen
      @splashscreen = Splashscreen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def splashscreen_params
      params.require(:splashscreen).permit(:name, :video)
    end
end

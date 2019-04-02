class Admin::StampimagesController < ApplicationController
  before_action :set_stampimage, only: [:show, :edit, :update, :destroy]
  before_action :authenticate
  

  layout 'admin/dashboard'
  # GET /admin/stampimages
  # GET /admin/stampimages.json
  def index
    @stampimages = Admin::Stampimage.all
  end

  # GET /admin/stampimages/1
  # GET /admin/stampimages/1.json
  def show
  end

  # GET /admin/stampimages/new
  def new
    @stampimage = Admin::Stampimage.new
  end

  # GET /admin/stampimages/1/edit
  def edit
  end

  # POST /admin/stampimages
  # POST /admin/stampimages.json
  def create
    @stampimage = Admin::Stampimage.new(stampimage_params)

    respond_to do |format|
      if @stampimage.save
        format.html { redirect_to @stampimage, notice: 'Stampimage was successfully created.' }
        format.json { render :show, status: :created, location: @stampimage }
      else
        format.html { render :new }
        format.json { render json: @stampimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stampimages/1
  # PATCH/PUT /admin/stampimages/1.json
  def update
    respond_to do |format|
      if @stampimage.update(stampimage_params)
        format.html { redirect_to @stampimage, notice: 'Stampimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @stampimage }
      else
        format.html { render :edit }
        format.json { render json: @stampimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stampimages/1
  # DELETE /admin/stampimages/1.json
  def destroy
    Userstamp.destroy_all(stamp_id: @stampimage)
    
    @stampimage.destroy
    respond_to do |format|
      format.html { redirect_to admin_stampimages_url, notice: 'Stampimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stampimage
      @stampimage = Admin::Stampimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stampimage_params
      params.require(:admin_stampimage).permit(:name, :rate, :image)
    end
    
     def authenticate
      if request.referer.nil? then
        redirect_to root_path
      end
    end
end

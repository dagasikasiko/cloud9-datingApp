class UserimagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_userimage, only: [:show, :edit, :update, :destroy]

  # GET /userimages
  # GET /userimages.json
  def index
    @userimages = Userimage.all
  end

  # GET /userimages/1
  # GET /userimages/1.json
  def show
  end

  # GET /userimages/new
  def new
    @userimage = Userimage.new
  end

  # GET /userimages/1/edit
  def edit
  end

  # POST /userimages
  # POST /userimages.json
  def create
    @userimage = Userimage.new(userimage_params)

    respond_to do |format|
      if @userimage.save
        format.html { redirect_to @userimage, notice: 'Userimage was successfully created.' }
        format.json { render :show, status: :created, location: @userimage }
      else
        format.html { render :new }
        format.json { render json: @userimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userimages/1
  # PATCH/PUT /userimages/1.json
  def update
    respond_to do |format|
      if @userimage.update(userimage_params)
        format.html { redirect_to @userimage, notice: 'Userimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @userimage }
      else
        format.html { render :edit }
        format.json { render json: @userimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userimages/1
  # DELETE /userimages/1.json
  def destroy
    @userimage.destroy
    respond_to do |format|
      format.html { redirect_to userimages_url, notice: 'Userimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userimage
      @userimage = Userimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userimage_params
      params.require(:userimage).permit(:user_id,:image,:image_cache,:remove_image)
    end
end

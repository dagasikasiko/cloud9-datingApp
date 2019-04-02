class StampimagesController < ApplicationController
  before_action :set_stampimage, only: [:show, :edit, :update, :destroy]

  # GET /stampimages
  # GET /stampimages.json
  def index
    @stampimages = Stampimage.all
    @stampimages = Stampimage.order("rate")
  end

  # GET /stampimages/1
  # GET /stampimages/1.json
  def show
  end

  # GET /stampimages/new
  def new
    @stampimage = Stampimage.new
  end

  # GET /stampimages/1/edit
  def edit
  end

  # POST /stampimages
  # POST /stampimages.json
  def create
    @stampimage = Stampimage.new(stampimage_params)

    respond_to do |format|
      if @stampimage.save
        format.html { redirect_to @stampimage, notice: 'スタンプは正常に登録されました。' }
        format.json { render :show, status: :created, location: @stampimage }
      else
        format.html { render :new }
        format.json { render json: @stampimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stampimages/1
  # PATCH/PUT /stampimages/1.json
  def update
    respond_to do |format|
      if @stampimage.update(stampimage_params)
        format.html { redirect_to @stampimage, notice: 'スタンプの情報を更新しました。' }
        format.json { render :show, status: :ok, location: @stampimage }
      else
        format.html { render :edit }
        format.json { render json: @stampimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stampimages/1
  # DELETE /stampimages/1.json
  def destroy
    @stampimage.destroy
    respond_to do |format|
      format.html { redirect_to stampimages_url, notice: 'スタンプを削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stampimage
      @stampimage = Stampimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stampimage_params
      params.require(:stampimage).permit(:name, :rate, :image, :image_cache, :remove_image)
    end
end

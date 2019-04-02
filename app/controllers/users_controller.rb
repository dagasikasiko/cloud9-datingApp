class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :mystamp]
  before_action :correct_user, only: [:edit,:update,:mystamp]
  include ApplicationHelper
  
  
  

  def index
    @users = User.all
    

    
    
    #@users=User.find_by_id(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @notes = @user.notes.order(created_at: :desc)
    @poe = Note.where(user_id: current_user.id).count
    @tomodatikana = 0
    if Frids.find_by(userid: current_user.id,friendid: @user.id)==nil
      @tomodatikana = 1
    end
    
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'プロフィール更新したよ！' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @notes = @user.notes.order(created_at: :desc)
    @poe = Note.where(user_id: current_user.id).count
    # @notes = Note.find(params[:id])
    # p @notes
    # if @notes == nil
    #   p aaaaaaaaaaaaaaa
    # end
  end

  def create
    
    
    @users = User.new(user_params)
    respond_to do |format|
      if @users.save
        format.html { redirect_to @users, notice: 'アカウントは正常に登録されました。' }
        # format.html { redirect_to "/type/choice", notice: 'アカウントは正常に登録されました。' }
        format.json { render :show, status: :created, location: @users }
      else
        format.html { render :new }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
    
    
    
  end
    
    
  #   file = params[:user][:image]
  #   @user.set_image(file)
  #   if @user.save
  #     redirect_to @user, notice: 'ユーザーが登録されました'
  #   else
  #     render :new
  #   end
  # end



  #def update
  #   file = params[:user][:image]
  #   @user.set_image(file)

  #   if @user.update(user_params)
  #     redirect_to @user, notice: 'ユーザー情報が更新されました'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   redirect_to users_url, notice: 'ユーザーが削除されました'
  def update
    @notes = @user.notes.order(created_at: :desc)
    @poe = Note.where(user_id: current_user.id).count
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'プロフィール更新したよ！' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def mystamp
      @user = User.find(params[:id])
      
      @userstamp = Userstamp.new
      # @userstamp = Userstamp.find_by(user_id: current_user.id)
      @userstamp = Userstamp.where(user_id: current_user.id).count
      
      if @userstamp == 0
        @userstamp = "nanimonai"
      else
        @userstamp = Userstamp.where(user_id: current_user.id)
      
      # @stampimage = Stampimage.new
      
      # @stampimage = Stampimage.where(stamp_id: @userstamp)
     
      
      
      end
    
      return @userstamp
  end
  
  

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email,:image)
    end

    def correct_user
      user = User.find_by_id(params[:id])
      if !current_user?(user)
        redirect_to root_path
      end
    end
    
    
    
end

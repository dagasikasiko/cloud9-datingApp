class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :mystamp]
  before_action :authenticate
  include ApplicationHelper
  layout 'admin/dashboard'

  def index
    @users = User.all
    #@users=User.find_by_id(params[:id])
  end

  def show
   # @user = User.find(params[:id])
    @notes = @user.notes
    @frid = Frids.where("userid = #{params[:id]}")
    @frienduser = User.all
  end
  

  def new
    @user = User.new
  end

  def edit
    
  end

  
  def destroy
    Note.destroy_all(user_id: @user)
    Userstamp.destroy_all(user_id: @user)
    Frids.destroy_all(userid: @user)
    Frids.destroy_all(friendid: @user)
    User.find(@user).delete
    flash[:success] = "ユーザを削除しました"
    redirect_to '/admin/users'
  end
 
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/admin/users/#{@user.id}", notice: 'ユーザを更新しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
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
    
    def authenticate
      if request.referer.nil? then
        redirect_to root_path
      end
    end
    
    
end

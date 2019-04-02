class FridsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @superflg = 0
        @user = Array.new
        @frid = Frids.where(userid: current_user.id)
        
        
        @frid.each do |id|
            @user.push(User.find_by(id: id.friendid)) 
        end
        
        if params[:name].present? 
            @user = User.get_by_name(params[:name])
        elsif @user.size <= 0 then
            @superflg = 1
        end
    end
    
    def show
        @user = User.find(params[:id]) 
    end
    
    def new
        @frid = Frids.new
        @user = User.all
    end
    
    def edit
        @user = User.find(params[:id]) 
    end
    
    def create
        @frid = Frids.new(id: current_user.id, friendid: 67)
        @frid.save
        @frid = Frids.new(friendid: 67, id: current_user.id)
        @frid.save
    end
    
    def destroy
        @frid = Frids.find_by(userid: current_user.id, friendid: params[:id])
        @frid.destroy
        @frid = Frids.find_by(userid: params[:id], friendid: current_user.id)
        @frid.destroy
        redirect_to frids_path
    end
    
    def frid_params
     params.require(:frids).permit(:userid, :friendid)
   end
end

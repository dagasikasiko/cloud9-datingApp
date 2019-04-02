class ChatController < ApplicationController
    before_action :authenticate_user!
    
    def index
        # ユーザIDの受け渡し
        @user_id_to = User.find_by(id: params[:user_id_to])
        
        # メッセージの受け渡し
        @messages = Message.where("user_id = ? and userid = ? or user_id = ? and userid = ?",
                    params[:user_id_to],current_user.id,current_user.id,params[:user_id_to])
                    
        @stamps = Userstamp.where(user_id: current_user.id).count
      
      if @stamps == 0
        @stamps = "nanimonai"
      else
        @stamps = Userstamp.where(user_id: current_user.id)
        
        $aite = @user_id_to
        $zibun = current_user

        
    end
                    
    end
    
    def id
        
    end
    
    def selecter
        # 自分以外のユーザの表示
        @users = User.where.not(id: current_user.id)
        
    end
    
end
class AdminController < ApplicationController
    
    layout false
    USERS = { "admin" => "pass" }
    before_action :authenticate

  private
 
  def authenticate

    #---------このへん修正必要！！！！！！！！！！！！------------#
    
    # ユーザが管理権限を持ってないならトップに戻す
    # if current_user.nil? then
    #   redirect_to :root
    # end
    # if current_user == nil? && current_user[:admin_flg]=== true then
      
    #   # redirect_to :root
    #   authenticate_or_request_with_http_digest do |username|
    #   USERS[username]
    #   end
      

      
    # else

    #   authenticate_or_request_with_http_digest do |username|
    #   USERS[username]
    #   end
      
    #   # redirect_to root_path
      
    # end
    
    
    
   
    
    
    if current_user.nil? 
      redirect_to root_path
      
    else
      if current_user[:admin_flg] === true
        # redirect_to :root
          authenticate_or_request_with_http_digest do |username|
          USERS[username]
          end
        
      else
        redirect_to root_path
        
      end
      
      
    end
      
   
    
    
    # ダイジェスト認証
    # authenticate_or_request_with_http_digest do |username|
    #   USERS[username]
    #   end
    
  end
end

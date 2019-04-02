class LeaveController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, only:[:user_id]
  
  def goodbye
  end

  def thankyou
    Note.destroy_all(user_id: current_user)
    Userstamp.destroy_all(user_id: current_user)
    Frids.destroy_all(userid: current_user)
    Frids.destroy_all(friendid: current_user)
    User.find(current_user).delete
    
    # Note.destroy_all(user_id: current_user)
    # User.find(current_user).delete
      flash[:success] = "ユーザーが削除されました。またのご来店をお待ちしております。"
      redirect_to "/"
  end
end

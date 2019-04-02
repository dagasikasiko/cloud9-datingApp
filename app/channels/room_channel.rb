class RoomChannel < ApplicationCable::Channel
  def subscribed
    # ユーザごとにストリーム
    # @user = User.find(5)
    # p @user
    # stream_for current_user
    
    # カスタムストリーム
    stream_from "room_channel#{current_user.id}"
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], userid: current_user.id, user_id: params['id']
  end
end
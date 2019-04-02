class MessageBroadcastJob < ApplicationJob
  def perform(message)
    if message.user_id.nil?
      # オールチャット用のブロードキャスト　宛先がない場合はroom_channelにストリームされる。
      # ActionCable.server.broadcast "room_channel",message: render_message(message)
    else
      # 宛先を指定した場合のストリーム　ルームチャンネルの語尾にユーザIDが付与され、ブロードキャストされる
      # 自分にストリーム
      ActionCable.server.broadcast "room_channel#{message.userid}",message: render_message(message)
      sleep(5)
      # 送る相手にストリーム
      ActionCable.server.broadcast "room_channel#{message.user_id}",message: render_message(message)
    end
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
class WebsocketMessageController < WebsocketRails::BaseController
  def recieve_message
    message = message();
    broadcast_message :show_message, message
  end
end
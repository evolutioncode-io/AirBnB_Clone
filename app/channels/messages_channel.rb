class MessagesChannel < ApplicationCable::Channel
  def subscribed #Check This
    stream_from "conversation_#{params[:id]}"
  end

  
end

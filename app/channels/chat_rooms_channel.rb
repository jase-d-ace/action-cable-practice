class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params["chat_room_id"]}_channel"
  end

  def unsubscribed

  end

  def receive(data)
    current_user.messages.create!(body: data["body"], chat_room_id: data["chat_room_id"])
  end
end

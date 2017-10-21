class ChatRoomsController < ApplicationController
  before_action :require_user

  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      puts "OK"
      render json: @chat_room
    else
      raise "Messed up!"
    end
  end

  private

  def chat_room_params
    params.permit(:title)
  end

end

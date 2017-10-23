class ChatRoomsController < ApplicationController
  before_action :require_user

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
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
    params.require(:chat_room).permit(:title)
  end

end

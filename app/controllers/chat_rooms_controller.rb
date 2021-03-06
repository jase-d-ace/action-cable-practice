class ChatRoomsController < ApplicationController
  before_action :require_user

  def index
    @chat_rooms = ChatRoom.all
    @users = User.all
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
      redirect_to chat_rooms_path
    else
      raise "Messed up!"
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    if @chat_room.destroy
      puts "OK"
      redirect_to chat_rooms_path
    else
      raise "Messed up!"
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :user_id)
  end

end

class RenameChatRoomColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :chat_rooms, :users_id, :user_id
  end
end

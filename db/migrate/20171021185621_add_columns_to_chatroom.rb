class AddColumnsToChatroom < ActiveRecord::Migration[5.1]
  def change
    add_column :chat_rooms, :title, :string
    add_reference :chat_rooms, :users, foreign_key: true
  end
end

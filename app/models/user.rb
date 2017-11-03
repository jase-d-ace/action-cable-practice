class User < ApplicationRecord

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

  def name
    # whoaaaaaa you can do stuff like this in rails?!
    # AWESOME!!!!
    email.split("@")[0]
  end

  def is_online
    self.update_attributes(online: true)
  end

  def is_offline
    self.update_attributes(online: false)
  end

  after_update_commit {AppearanceBroadcastJob.perform_later self}

end

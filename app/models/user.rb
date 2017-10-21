class User < ApplicationRecord

  has_many :chat_rooms, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

end

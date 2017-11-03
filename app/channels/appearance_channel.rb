class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    user = User.where(id: current_user.id).first
    return unless user
    user.is_online
    stream_from "appearance"
  end

  def unsubscribed
    user = User.where(id: current_user.id).first
    return unless user
    user.is_offline
  end
end

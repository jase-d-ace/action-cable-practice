module ApplicationCable
  # following this tutorial
  # http://guides.rubyonrails.org/action_cable_overview.html
  class Connection < ActionCable::Connection::Base
    # identified_by is a connection identifier
    # effectively, this is the rails version of socket.on('connect', callback)
    # also lets us have access to current_user
    identified_by :current_user
    def connect
      self.current_user = find_verified_user
      logger.add_tags "ActionCable", current_user.email
    end

    private

    def find_verified_user
      if current_user = env["warden"].user
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

class WelcomeController < ApplicationController
  before_action :require_user
  def index
    render json: {
      message: "yo we're live"
    }
    puts current_user.id
  end
end

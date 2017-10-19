class WelcomeController < ApplicationController
  def index
    render json: {
      message: "yo we're live"
    }
  end
end

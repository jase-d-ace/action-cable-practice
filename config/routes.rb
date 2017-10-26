Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => "/cable"

  root to: "chat_rooms#index"

  resources :chat_rooms, only: [:new, :create, :show, :index]
end

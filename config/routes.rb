Rails.application.routes.draw do
  devise_for :users
  root to: "doppelgangers#index"

  get "/my_roster", to: "doppelgangers#roster"
  resources :doppelgangers do
    resources :bookings, only: :create
  end

  # get "/renter-bookings", to: "bookings#renter_bookings_index"
  resources :bookings, only: %i[index show new destroy]
  get "/bookings/:id/set-status", to: "bookings#set_status", as: :set_status
end

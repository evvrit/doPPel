Rails.application.routes.draw do
  devise_for :users
  root to: "doppelgangers#index"

  get "/agent-dopplegangers/:id", to: "doppelgangers#show"
  resources :doppelgangers do
    resources :bookings, only: :create
  end

  # get "/renter-bookings", to: "bookings#renter_bookings_index"
  resources :bookings, only: %i[index show new destroy]
end

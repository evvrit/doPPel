Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/agent-dopplegangers/:id", to: "doppelgangers#show"
  resources :doppelgangers do
    resources :bookings
  end
end

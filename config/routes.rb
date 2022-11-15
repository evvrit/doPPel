Rails.application.routes.draw do
  devise_for :users
  root to: "doppelgangers#index"

  get "/agent-dopplegangers/:id", to: "doppelgangers#show"
  resources :doppelgangers
end

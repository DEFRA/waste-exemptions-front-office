# frozen_string_literal: true

Rails.application.routes.draw do
  mount WasteExemptionsEngine::Engine => "/"

  root "waste_exemptions_engine/start_forms#new"

  get "/stats", to: "stats#index", as: :stats

  resource :cookies, only: [:update] do
    member do
      post :accept_analytics
      post :reject_analytics
      post :hide_this_message
    end
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  mount WasteExemptionsEngine::Engine => "/"

  mount DefraRubyMocks::Engine => "/fo/mocks"

  root "waste_exemptions_engine/start_forms#new"

  get "/Getting_ready_for_change", to: "pages#getting_ready_for_change"
end

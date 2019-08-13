# frozen_string_literal: true

FactoryBot.define do
  factory :registration_exemption, class: WasteExemptionsEngine::RegistrationExemption do
    exemption
    expires_on { Date.today + 3.years }
    registered_on { Date.today }
  end
end

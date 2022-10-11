# frozen_string_literal: true

FactoryBot.define do
  factory :registration_exemption, class: "WasteExemptionsEngine::RegistrationExemption" do
    exemption
    expires_on { Time.zone.today + 3.years }
    registered_on { Time.zone.today }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :front_office_edit_registration, class: "WasteExemptionsEngine::FrontOfficeEditRegistration" do
    # Create a new registration when initializing so we can copy its data
    initialize_with do
      new(reference: create(:registration).reference)
    end
  end
end

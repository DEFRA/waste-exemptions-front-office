# frozen_string_literal: true

FactoryBot.define do
  factory :registration, class: WasteExemptionsEngine::Registration do
    location { "england" }
    applicant_phone { "01234567890" }
    contact_phone { "01234567890" }
    business_type { "limitedCompany" }
    company_no { "09360070" }
    on_a_farm { true }
    is_a_farmer { true }

    submitted_at { DateTime.now }

    registration_exemptions { build_list(:registration_exemption, 3) }

    sequence :applicant_email do |n|
      "applicant#{n}@example.com"
    end

    sequence :applicant_first_name do |n|
      "Firstapp#{n}"
    end

    sequence :applicant_last_name do |n|
      "Lastapp#{n}"
    end

    sequence :contact_email do |n|
      "contact#{n}@example.com"
    end

    sequence :contact_first_name do |n|
      "Firstcontact#{n}"
    end

    sequence :contact_last_name do |n|
      "Lastcontact#{n}"
    end

    sequence :operator_name do |n|
      "Operator #{n}"
    end

    sequence :reference do |n|
      "WEX#{n}"
    end

    addresses do
      [build(:address, :operator),
       build(:address, :contact),
       build(:address, :site)]
    end
  end
end

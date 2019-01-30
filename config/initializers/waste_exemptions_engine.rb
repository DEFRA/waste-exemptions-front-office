# frozen_string_literal: true

WasteExemptionsEngine.configure do |configuration|
  # General config
  configuration.application_name = "waste-exemptions-front-office"
  configuration.git_repository_url = "https://github.com/DEFRA/waste-exemptions-front-office"

  # Companies house API config
  configuration.companies_house_host = ENV["COMPANIES_HOUSE_URL"] || "https://api.companieshouse.gov.uk/company/"
  configuration.companies_house_api_key = ENV["COMPANIES_HOUSE_API_KEY"]

  # Addressbase facade config
  configuration.addressbase_url = ENV["ADDRESSBASE_URL"] || "http://localhost:9002"
  # Email config
  configuration.email_service_email = ENV["EMAIL_SERVICE_EMAIL"] || "wex-local@example.com"

  # PDF config
  configuration.use_xvfb_for_wickedpdf = ENV["USE_XVFB_FOR_WICKEDPDF"] || "true"
end

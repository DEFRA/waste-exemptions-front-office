# frozen_string_literal: true

require File.expand_path("boot", __dir__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/all"
require "active_record/connection_adapters/postgresql_adapter"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WasteExemptionsFrontOffice
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoloader = :classic
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "UTC"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Rails.root.glob("config/locales/**/*.{rb,yml}")

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    # Don't add field_with_errors div wrapper around fields with errors. When
    # rails does this it messes with the GOV.UK styling and causes checkboxes
    # and radio buttons to become invisible
    # rubocop:disable Rails/OutputSafety
    config.action_view.field_error_proc = proc { |html_tag, _instance|
      html_tag.to_s.html_safe
    }
    # rubocop:enable Rails/OutputSafety

    # https://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#active-record-belongs-to-required-by-default-option
    config.active_record.belongs_to_required_by_default = false

    # https://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#expiry-in-signed-or-encrypted-cookie-is-now-embedded-in-the-cookies-values
    # config.action_dispatch.use_authenticated_cookie_encryption = false

    # Paths
    config.front_office_url = ENV["FRONT_OFFICE_URL"] || "http://localhost:3000"
    config.back_office_url = ENV["BACK_OFFICE_URL"] || "http://localhost:8000"
    config.host = config.front_office_url

    # Companies house API config
    config.companies_house_host = ENV["COMPANIES_HOUSE_URL"] || "https://api.companieshouse.gov.uk"
    config.companies_house_api_key = ENV.fetch("COMPANIES_HOUSE_API_KEY", nil)

    # Emails
    config.email_test_address = ENV.fetch("EMAIL_TEST_ADDRESS", nil)

    # Fix sass compilation error in govuk_frontend:
    # SassC::SyntaxError: Error: "calc(0px)" is not a number for `max'
    # https://github.com/alphagov/govuk-frontend/issues/1350
    config.assets.css_compressor = nil

    # Govpay
    config.govpay_url = if ENV["WEX_MOCK_ENABLED"].to_s.downcase == "true"
      ENV.fetch("WEX_MOCK_BO_GOVPAY_URL", nil)
    else
      ENV["WEX_GOVPAY_URL"] || "https://publicapi.payments.service.gov.uk/v1"
    end
    config.govpay_front_office_api_token = ENV.fetch("WEX_GOVPAY_FRONT_OFFICE_API_TOKEN", nil)
    config.govpay_back_office_api_token = ENV.fetch("WEX_GOVPAY_BACK_OFFICE_API_TOKEN", nil)
  end
end

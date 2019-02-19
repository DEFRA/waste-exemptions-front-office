require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WasteExemptionsFrontOffice
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # We have an issue when deploying to our environments in that when
    # Capistrano runs the deploy:assets:precompile step (specifically bundle
    # exec rake assets:precompile) it does so having set RAILS_ENV to production.
    # However we have no default value for the SECRET_KEY in production, and
    # when the command runs an env var with the value has not been set. This
    # causes Devise to throw an error which prevents the task from completing.
    # We have found the simplest solution to the problem is to add this logic
    # which determines if we are running in production and if the originating
    # call was made from rake. If that's the case we can assume a task like
    # assets:precompile is being run and therefore programmtically set the
    # secret key, stopping devise from erroring.
    # https://stackoverflow.com/a/15767148/6117745
    def apply_dummy_secret_key?
      return false unless Rails.env.production?
      return false unless File.basename($0) == "rake"
      return false unless config.secret_key_base.blank?

      true
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = "UTC"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Don't add field_with_errors div wrapper around fields with errors. When
    # rails does this it messes with the GOV.UK styling and causes checkboxes
    # and radio buttons to become invisible
    config.action_view.field_error_proc = proc { |html_tag, _instance|
      "#{html_tag}".html_safe
    }

    # Paths
    config.front_office_url = ENV["FRONT_OFFICE_URL"] || "http://localhost:3001"
    config.back_office_url = ENV["BACK_OFFICE_URL"] || "http://localhost:8001"

    # Emails
    config.email_test_address = ENV["EMAIL_TEST_ADDRESS"]

    config.secret_key_base = "iamonlyherefordevisewhenraketasksarecalled" if apply_dummy_secret_key?
  end
end

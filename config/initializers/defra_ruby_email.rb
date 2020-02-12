# frozen_string_literal: true

DefraRubyEmail.configure do |configuration|
  # Enable the last-email route mounted in this app if the environment is
  # fconfigured
  configuration.enable = ENV["USE_LAST_EMAIL_CACHE"] || false
end

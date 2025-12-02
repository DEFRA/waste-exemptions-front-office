# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.4.6"

# Allows us to automatically generate the change log from the tags, issues,
# labels and pull requests on GitHub. Added as a dependency so all dev's have
# access to it to generate a log, and so they are using the same version.
# New dev's should first create GitHub personal app token and add it to their
# ~/.bash_profile (or equivalent)
# https://github.com/skywinder/github-changelog-generator#github-token
# Then simply run `bundle exec rake changelog` to update CHANGELOG.md
# Should be in the :development group however when it is it breaks deployment
# to Heroku. Hence moved outside group till we can understand why.
gem "github_changelog_generator", require: false

# GOV.UK design system styling
gem "defra_ruby_template", "~> 5.11"
# GOV.UK design system forms
gem "govuk_design_system_formbuilder"
# Use jquery as the JavaScript library
gem "jquery-rails"

gem "faraday-retry"

gem "matrix"

gem "net-imap"
gem "net-pop"

# Automatically kills connections to Postgres when running rake tasks that
# involve a database drop. Stops the error
# PG::ObjectInUse: ERROR:  database "wex_db" is being accessed by other users
gem "pgreset"

# See: https://github.com/sass/sassc-rails/issues/114
gem "sassc-rails"

# Automatically apply http headers that are related to security
gem "secure_headers", "~> 6.5"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

# Use the waste exemptions engine for the user journey
gem "waste_exemptions_engine",
    git: "https://github.com/DEFRA/waste-exemptions-engine",
    branch: "RUBY-4090-wex-deregistered-exemptions-are-removed-after-registration-edit"

# Enable Defra ruby mocks for govpay
gem "defra_ruby_mocks"

# Web application server that replaces webrick. It handles HTTP requests,
# manages processes and resources, and enables administration, monitoring
# and problem diagnosis. It is used in production because it gives us an ability
# to scale by creating additional processes, and will automatically restart any
# that fail. We don't use it when running tests for speed's sake.
# Pinning to avoid a rackup error with version 6.0.23:
gem "passenger", "~> 6.0", "!= 6.0.23", require: "phusion_passenger/rack_handler"

group :development, :test do
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem "pry-byebug"
  # Manages our rubocop style rules for all defra ruby projects
  gem "defra_ruby_style"
  # Shim to load environment variables from a .env file into ENV in development
  # and test
  gem "dotenv-rails"
  # Project uses RSpec as its test framework
  gem "rspec-rails"
  gem "rubocop-capybara"
  gem "rubocop-factory_bot"
  gem "rubocop-rails"
  gem "rubocop-rake"
  gem "rubocop-rspec"
  gem "rubocop-rspec_rails"
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-commands-rspec"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console"
  gem "webrick"
end

group :test do
  gem "capybara"
  # Database Cleaner is a set of strategies for cleaning your database in Ruby.
  gem "database_cleaner"
  # Fixtures replacement
  gem "factory_bot_rails"
  # Generates a test coverage report on every `bundle exec rspec` call. We use
  # the output to feed SonarCloud's stats and analysis
  gem "simplecov", "~> 0.22.0", require: false
end

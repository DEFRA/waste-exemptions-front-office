# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/ExampleLength
# rubocop:disable RSpec/MultipleExpectations
RSpec.describe "Cookies" do
  let(:cookie_banner_div) { ".govuk-cookie-banner" }

  it "does not show the cookie banner when no cookie preferences are stored" do
    visit root_path

    expect(page).to have_css("body")
    expect(page).to have_no_css(cookie_banner_div)
  end

  it "does not show the cookie banner when the legacy policy cookie is accepted" do
    page.driver.browser.set_cookie("cookies_policy=analytics_accepted")

    visit root_path

    expect(page).to have_css("body")
    expect(page).to have_no_css(cookie_banner_div)
  end

  it "does not show the cookie banner when the legacy policy cookie is rejected" do
    page.driver.browser.set_cookie("cookies_policy=analytics_rejected")

    visit root_path

    expect(page).to have_css("body")
    expect(page).to have_no_css(cookie_banner_div)
  end

  it "does not show the cookie banner when the legacy banner cookie is stored" do
    page.driver.browser.set_cookie("cookies_preferences_set=true")

    visit root_path

    expect(page).to have_css("body")
    expect(page).to have_no_css(cookie_banner_div)
  end

  it "only shows the session cookie on the cookies page" do
    visit "/pages/cookies"

    expect(page).to have_text("We use 1 type of cookie.")
    expect(page).to have_text("_waste-exemptions-front-office_session")
    expect(page).to have_no_text("cookies_policy")
    expect(page).to have_no_text("_ga")
    expect(page).to have_no_text("_gid")
    expect(page).to have_no_link("change your cookie settings")
  end
end
# rubocop:enable RSpec/MultipleExpectations
# rubocop:enable RSpec/ExampleLength

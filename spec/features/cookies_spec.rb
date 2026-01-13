# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/ExampleLength
# rubocop:disable RSpec/MultipleExpectations
RSpec.describe "Cookies" do
  let(:cookie_banner_div) { ".govuk-cookie-banner" }

  it "User accepts analytics cookies" do
    visit root_path
    expect(page).to have_link("View cookies", href: "/pages/cookies")

    click_on "Accept analytics cookies"
    expect(page).to have_text("You've accepted analytics cookies")

    within cookie_banner_div do
      expect(page).to have_link("change your cookie settings", href: "/cookies/edit")
      click_on "Hide this message"
    end

    expect(page).to have_no_css(cookie_banner_div)
  end

  it "User rejects analytics cookies and toggles their selection" do
    visit root_path
    click_on "Reject analytics cookies"
    expect(page).to have_text("You've rejected analytics cookies")

    click_on "change your cookie settings"
    expect(page).to have_css("h1", text: "Cookies on Register your waste exemptions")

    choose "Use cookies that measure my website use"
    click_on "Save and continue"
    expect(page).to have_text("You've set your cookie preferences.")

    choose "Do not use cookies that measure my website use"
    click_on "Save and continue"
  end
end
# rubocop:enable RSpec/MultipleExpectations
# rubocop:enable RSpec/ExampleLength

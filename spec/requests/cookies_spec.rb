# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Cookies" do
  describe "POST /cookies/accept_analytics" do
    it "sets the cookies_policy cookie to analytics_accepted" do
      post "/cookies/accept_analytics"

      expect(response.cookies["cookies_policy"]).to eq("analytics_accepted")
    end

    it "redirects to root path" do
      post "/cookies/accept_analytics"

      expect(response).to redirect_to("/")
    end
  end

  describe "POST /cookies/reject_analytics" do
    it "sets the cookies_policy cookie to analytics_rejected" do
      post "/cookies/reject_analytics"

      expect(response.cookies["cookies_policy"]).to eq("analytics_rejected")
    end

    it "redirects to root path" do
      post "/cookies/reject_analytics"

      expect(response).to redirect_to("/")
    end
  end

  describe "POST /cookies/hide_this_message" do
    it "sets the cookies_preferences_set cookie to true" do
      post "/cookies/hide_this_message"

      expect(response.cookies["cookies_preferences_set"]).to eq("true")
    end

    it "redirects to root path" do
      post "/cookies/hide_this_message"

      expect(response).to redirect_to("/")
    end
  end

  describe "PATCH /cookies" do
    context "when accepting analytics" do
      it "sets the cookies_policy cookie to analytics_accepted" do
        patch "/cookies", params: { analytics: "accept" }

        expect(response.cookies["cookies_policy"]).to eq("analytics_accepted")
      end

      it "sets the cookies_preferences_set cookie to true" do
        patch "/cookies", params: { analytics: "accept" }

        expect(response.cookies["cookies_preferences_set"]).to eq("true")
      end

      it "redirects to cookies edit page with cookies_updated param" do
        patch "/cookies", params: { analytics: "accept" }

        expect(response).to redirect_to("/cookies/edit?cookies_updated=true")
      end
    end

    context "when rejecting analytics" do
      it "sets the cookies_policy cookie to analytics_rejected" do
        patch "/cookies", params: { analytics: "reject" }

        expect(response.cookies["cookies_policy"]).to eq("analytics_rejected")
      end

      it "sets the cookies_preferences_set cookie to true" do
        patch "/cookies", params: { analytics: "reject" }

        expect(response.cookies["cookies_preferences_set"]).to eq("true")
      end

      it "redirects to cookies edit page with cookies_updated param" do
        patch "/cookies", params: { analytics: "reject" }

        expect(response).to redirect_to("/cookies/edit?cookies_updated=true")
      end
    end
  end
end

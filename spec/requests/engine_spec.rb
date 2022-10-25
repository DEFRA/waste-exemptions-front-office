# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Waste Exemptions Engine" do
  describe "/start/new" do
    let(:request_path) { "/start" }

    it "returns a 200 response" do
      get request_path
      expect(response).to have_http_status(:ok)
    end
  end
end

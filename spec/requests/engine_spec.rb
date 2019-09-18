# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Waste Exemptions Engine", type: :request do
  describe "/start/new" do
    let(:request_path) { "/start" }

    it "returns a 200 response" do
      get request_path
      expect(response).to have_http_status(200)
    end
  end
end

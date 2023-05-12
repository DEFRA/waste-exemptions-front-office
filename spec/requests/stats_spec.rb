# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Stats API" do
  describe "/stats" do
    let(:request_path) { "/stats" }

    it "returns a 200 response" do
      get request_path
      expect(response).to have_http_status(:ok)
    end

    it "is JSON" do
      get request_path
      expect { response.parsed_body }.not_to raise_exception
    end
  end
end

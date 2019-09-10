# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Stats API", type: :request do
  describe "/stats" do
    let(:request_path) { "/stats" }

    it "returns a 200 response" do
      get request_path
      expect(response).to have_http_status(200)
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Static pages" do
  describe "/" do
    let(:request_path) { "/Getting_ready_for_change" }

    it "returns a 200 response" do
      get request_path
      expect(response).to have_http_status(:ok)
    end
  end
end

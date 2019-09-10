# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stats do
  describe "#new_reg" do
    it "returns the correct value for new_reg" do
      stats = Stats.new
      expect(stats.new_reg).to eq(25)
    end
  end

  describe "#assisted_pc" do
    it "returns the correct value for assisted_pc" do
      stats = Stats.new
      expect(stats.assisted_pc).to eq(35.4)
    end
  end

  describe "#email_renewals" do
    it "returns the correct value for email_renewals" do
      stats = Stats.new
      expect(stats.email_renewals).to eq(17)
    end
  end
end

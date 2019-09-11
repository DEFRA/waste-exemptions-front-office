# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stats, type: :model do
  subject { described_class.new }

  describe "#new_reg" do
    it "returns the correct value" do
      expect(subject.new_reg).to eq(25)
    end
  end

  describe "#assisted_pc" do
    it "returns the correct value" do
      expect(subject.assisted_pc).to eq(35.4)
    end
  end

  describe "#email_renewals" do
    it "returns the correct value" do
      expect(subject.email_renewals).to eq(17)
    end
  end
end

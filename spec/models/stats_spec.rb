# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stats, type: :model do
  subject { described_class.new }

  describe "#new_reg" do
    it "only counts registrations in the correct range" do
      create(:registration, submitted_at: Date.today)
      create(:registration, submitted_at: Date.today - 1)
      create(:registration, submitted_at: Date.today - 7)
      create(:registration, submitted_at: Date.today - 8)
      expect(subject.new_reg).to eq(2)
    end

    it "only counts new registrations" do
      create(:registration, submitted_at: Date.today - 1)
      create(:registration, submitted_at: Date.today - 1, referring_registration_id: 111)
      expect(subject.new_reg).to eq(1)
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

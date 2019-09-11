# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stats, type: :model do
  subject { described_class.new }

  describe "#new_reg" do
    it "only counts registrations in the correct date range" do
      (0..8).each do |day|
        create(:registration, submitted_at: Date.today - day)
      end
      expect(subject.new_reg).to eq(7)
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

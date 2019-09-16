# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stats, type: :model do
  subject { described_class.new }

  describe "#new_reg" do
    it "only counts registrations in the correct date range" do
      (0..8).each do |n|
        create(:registration, submitted_at: n.days.ago.beginning_of_day)
      end

      expect(subject.new_reg).to eq(7)
    end

    it "only counts new registrations" do
      create(:registration, submitted_at: 1.day.ago.beginning_of_day)
      create(:registration, :was_renewed, submitted_at: 1.day.ago.beginning_of_day)

      expect(subject.new_reg).to eq(1)
    end
  end

  describe "#assisted_pc" do
    it "returns the correct value" do
      create(:registration, submitted_at: 1.day.ago.beginning_of_day)
      create(:registration, submitted_at: 2.day.ago.beginning_of_day)
      create(:registration, :was_assisted, submitted_at: 3.day.ago.beginning_of_day)

      expect(subject.assisted_pc).to eq(33.3)
    end

    it "handles no assisted registrations correctly" do
      (1..3).each do |n|
        create(:registration, submitted_at: n.days.ago.beginning_of_day)
      end

      expect(subject.assisted_pc).to eq(0)
    end

    it "handles all assisted registrations correctly" do
      (1..3).each do |n|
        create(:registration, :was_assisted, submitted_at: n.days.ago.beginning_of_day)
      end

      expect(subject.assisted_pc).to eq(100)
    end
  end

  describe "#email_renewals" do
    it "returns the correct value" do
      expect(subject.email_renewals).to eq(17)
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

module Stats
  RSpec.describe AssistedRegistrations, type: :model do
    subject { described_class.new(current_registrations, previous_registrations) }

    describe "#current" do

      context "where there are new registrations" do

        let(:current_registrations) do
          create(:registration, submitted_at: 1.day.ago.beginning_of_day)
          create(:registration, submitted_at: 2.day.ago.beginning_of_day)
          create(:registration, :was_assisted, submitted_at: 3.day.ago.beginning_of_day)
          WasteExemptionsEngine::Registration.all
        end

        let(:previous_registrations) { WasteExemptionsEngine::Registration.all }

        it "returns the correct value" do
          expect(subject.current).to eq(33.3)
        end

      end

      context "where there are new registrations not assisted" do

        let(:current_registrations) do
          (1..3).each do |n|
            create(:registration, submitted_at: n.days.ago.beginning_of_day)
          end
          WasteExemptionsEngine::Registration.all
        end

        let(:previous_registrations) { current_registrations }

        it "returns 0" do
          expect(subject.current).to eq(0)
        end

      end

      context "where there are no registrations" do

        let(:current_registrations) { WasteExemptionsEngine::Registration.all }
        let(:previous_registrations) { WasteExemptionsEngine::Registration.all }

        it "returns 0" do
          expect(subject.current).to eq(0)
        end

      end

      context "where all new registrations are assisted" do
        let(:current_registrations) do
          (1..3).each do |n|
            create(:registration, :was_assisted, submitted_at: n.days.ago.beginning_of_day)
          end

          WasteExemptionsEngine::Registration.all
        end

        let(:previous_registrations) { current_registrations }

        it "returns 100" do
          expect(subject.current).to eq(100)
        end
      end
    end
  end
end

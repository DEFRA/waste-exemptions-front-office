# frozen_string_literal: true

require "rails_helper"

module Stats
  RSpec.describe EmailRenewals, type: :model do
    subject(:email_renewals) { described_class.new(current_registrations, previous_registrations) }

    describe "#calculate_stat" do
      context "when there are renewals" do
        let(:current_registrations) do
          3.times { create(:registration, submitted_at: 1.day.ago.beginning_of_day) }
          create(:registration, :was_renewed, submitted_at: 1.day.ago.beginning_of_day)
          WasteExemptionsEngine::Registration.all
        end

        let(:previous_registrations) { WasteExemptionsEngine::Registration.all }

        it "only counts renewals" do
          expect(email_renewals.current).to eq(1)
        end
      end

      context "when there are no renewals" do
        let(:current_registrations) do
          create(:registration, submitted_at: 1.day.ago.beginning_of_day)
          WasteExemptionsEngine::Registration.all
        end

        let(:previous_registrations) { WasteExemptionsEngine::Registration.all }

        it "returns 0" do
          expect(email_renewals.current).to eq(0)
        end
      end
    end
  end
end

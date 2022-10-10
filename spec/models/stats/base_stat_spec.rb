# frozen_string_literal: true

require "rails_helper"

# rubocop:disable RSpec/EmptyExampleGroup
module Stats
  RSpec.describe BaseStat, type: :model do
    subject { described_class.new(current_registrations, previous_registrations) }

    # TODO: This test needs to be completed to ensure that the output is
    # correctly tested.

    # context "#json" do

    #   let(:current_registrations) do
    #     create(:registration, submitted_at: 1.day.ago.beginning_of_day)
    #     create(:registration, submitted_at: 2.day.ago.beginning_of_day)
    #     create(:registration, :was_assisted, submitted_at: 3.day.ago.beginning_of_day)
    #     WasteExemptionsEngine::Registration.all
    #   end

    #   let(:previous_registrations) { WasteExemptionsEngine::Registration.all }

    #   let(:expected_json) do
    #     {
    #       :new_reg => 33.3,
    #       :new_reg_change => 0.0
    #     }
    #   end

    #   it "returns expected json" do
    #     json = subject.json
    #     puts json
    #     expect(json).to eq(expected_json)
    #   end
    # end

  end
end
# rubocop:enable RSpec/EmptyExampleGroup

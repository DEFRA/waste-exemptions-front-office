# frozen_string_literal: true

require "rails_helper"

module Stats
  RSpec.describe StatsFormatter do
    subject(:formatter) { described_class.new }

    describe "#json" do

      let(:expected_json) do
        {
          new_reg: 0,
          assisted_pc: 0,
          email_renewals: 0,
          new_reg_change: "",
          assisted_pc_change: "",
          email_renewals_change: ""
        }
      end

      it "returns correct JSON format" do
        expect(formatter.json).to eq(expected_json)
      end
    end
  end
end

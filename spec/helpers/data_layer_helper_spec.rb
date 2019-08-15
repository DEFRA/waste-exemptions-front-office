# frozen_string_literal: true

require "rails_helper"

RSpec.describe DataLayerHelper, type: :helper do
  describe "data_layer" do
    context "when the transient_registration has a `start_option` of 'reregister'" do
      let(:transient_registration) { build(:new_registration, start_option: "reregister") }

      it "returns the correct value" do
        expected_string = "'journey': 'reregister'"

        expect(helper.data_layer(transient_registration)).to eq(expected_string)
      end
    end

    context "when the transient_registration is an EditRegistration" do
      let(:transient_registration) { build(:edit_registration) }

      it "returns the correct value" do
        expected_string = "'journey': 'edit'"

        expect(helper.data_layer(transient_registration)).to eq(expected_string)
      end
    end

    context "when the transient_registration is a NewRegistration" do
      let(:transient_registration) { build(:new_registration) }

      it "returns the correct value" do
        expected_string = "'journey': 'new'"

        expect(helper.data_layer(transient_registration)).to eq(expected_string)
      end
    end

    context "when the transient_registration is a RenewingRegistration" do
      let(:transient_registration) { build(:renewing_registration) }

      it "returns the correct value" do
        expected_string = "'journey': 'renew'"

        expect(helper.data_layer(transient_registration)).to eq(expected_string)
      end
    end
  end
end

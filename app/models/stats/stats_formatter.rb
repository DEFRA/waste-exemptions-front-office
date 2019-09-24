# frozen_string_literal: true

module Stats
  class StatsFormatter
    def initialize
      # test this by creating some registrations and checking output
      @current_reg = retrieve_reg(from: 7, to: 1)
      @previous_reg = retrieve_reg(from: 14, to: 8)
    end

    def json
      new_reg = NewRegistrations.new(@current_reg, @previous_reg)
      assisted_pc = AssistedRegistrations.new(@current_reg, @previous_reg)
      email_renewals = EmailRenewals.new(@current_reg, @previous_reg)

      {
        new_reg: new_reg.current,
        assisted_pc: assisted_pc.current,
        email_renewals: email_renewals.current,
        new_reg_change: new_reg.change,
        assisted_pc_change: assisted_pc.change,
        email_renewals_change: email_renewals.change
      }
    end

    private

    def retrieve_reg(from:, to:)
      from_date = from.days.ago.beginning_of_day
      to_date = to.days.ago.beginning_of_day

      WasteExemptionsEngine::Registration.where(submitted_at: from_date..to_date)
    end
  end
end

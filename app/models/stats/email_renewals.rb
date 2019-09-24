# frozen_string_literal: true

module Stats
  class EmailRenewals < BaseStat
    def initialize(current_registrations, previous_registrations)
      @json_name = "email_renewals"
      super
    end

    private

    def calculate_stat(registrations)
      registrations.where(assistance_mode: nil).where.not(referring_registration_id: nil).count
    end
  end
end

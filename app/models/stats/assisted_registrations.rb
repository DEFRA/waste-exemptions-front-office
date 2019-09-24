# frozen_string_literal: true

module Stats
  class AssistedRegistrations < BaseStat
    def initialize(current_registrations, previous_registrations)
      @json_name = "assisted_pc"
      super
    end

    private

    def calculate_stat(registrations)
      return 0 if registrations.count.zero?

      decimal_to_percentage((assisted_registrations(registrations).count.to_f / registrations.count.to_f))
    end

    def assisted_registrations(registrations)
      registrations.where(assistance_mode: "full")
    end
  end
end

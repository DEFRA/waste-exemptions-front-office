# frozen_string_literal: true

module Stats
  class NewRegistrations < BaseStat
    def initialize(current_registrations, previous_registrations)
      @json_name = "new_reg"
      super
    end

    private

    def calculate_stat(registrations)
      registrations.where(referring_registration_id: nil).count
    end
  end
end
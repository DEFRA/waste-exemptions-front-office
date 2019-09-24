# frozen_string_literal: true

module Stats
  class BaseStat
    attr_reader :current, :change

    def initialize(current_registrations, previous_registrations)
      @current = calculate_stat(current_registrations)
      @previous = calculate_stat(previous_registrations)
      @change = calculate_change
    end

    def json
      {
        @json_name.to_sym => @current,
        "#{@json_name}_change".to_sym => @change
      }
    end

    private

    def calculate_stat
      raise NotImplementedError, "This #{self.class} cannot respond to:"
    end

    def calculate_change
      # Return an empty string if previous is zero to avoid a divide by zero error.
      # The empty string is for ease of handling in Google Data Studio.
      return "" if @previous.zero?

      change = (@current - @previous) / @previous.to_f
      decimal_to_percentage(change)
    end

    def decimal_to_percentage(input_decimal)
      (input_decimal * 100).round(1)
    end
  end
end

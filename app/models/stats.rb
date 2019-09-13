# frozen_string_literal: true

class Stats
  attr_reader :new_reg, :assisted_pc, :email_renewals

  def initialize
    @new_reg = calculate_new_reg
    @assisted_pc = calculate_assisted_pc
    @email_renewals = calculate_email_renewals
  end

  private

  def calculate_new_reg
    from = 7.days.ago.beginning_of_day
    to = 1.day.ago.beginning_of_day

    WasteExemptionsEngine::Registration.where(submitted_at: from..to, referring_registration_id: nil).count
  end

  def calculate_assisted_pc
    35.4
  end

  def calculate_email_renewals
    17
  end
end

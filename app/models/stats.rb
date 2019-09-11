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
    start_date = (Date.today - 7).to_s
    end_date = (Date.today - 1).to_s
    WasteExemptionsEngine::Registration.where("submitted_at BETWEEN ? AND ?
      AND referring_registration_id IS NULL", start_date, end_date).count
  end

  def calculate_assisted_pc
    35.4
  end

  def calculate_email_renewals
    17
  end
end

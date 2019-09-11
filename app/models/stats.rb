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
    WasteExemptionsEngine::Registration.where("submitted_at BETWEEN ? AND ? AND referring_registration_id IS NULL", (Date.today - 6).to_s, (Date.today - 1).to_s).count
  end

  def calculate_assisted_pc
    35.4
  end

  def calculate_email_renewals
    17
  end
end

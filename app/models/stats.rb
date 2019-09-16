# frozen_string_literal: true

class Stats

  def new_reg
    @_new_reg ||= count_new_reg
  end

  def assisted_pc
    @_assisted_pc ||= calculate_assisted_pc
  end

  def email_renewals
    @_email_renewals ||= calculate_email_renewals
  end

  private

  def count_new_reg
    reg_from_last_week.where(referring_registration_id: nil).count
  end

  def calculate_assisted_pc
    ((count_assisted_reg.to_f / count_new_reg.to_f) * 100).round(1)
  end

  def calculate_email_renewals
    17
  end

  def count_assisted_reg
    @_count_assisted_reg ||= reg_from_last_week.where.not(assistance_mode: nil).count
  end

  def reg_from_last_week
    @_reg_from_last_week ||= retrieve_reg_from_last_week
  end

  def retrieve_reg_from_last_week
    from = 7.days.ago.beginning_of_day
    to = 1.day.ago.beginning_of_day

    WasteExemptionsEngine::Registration.where(submitted_at: from..to)
  end

end

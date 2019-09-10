# frozen_string_literal: true

class Stats
  attr_reader :new_reg, :assisted_pc, :email_renewals

  def initialize
    @new_reg = 25
    @assisted_pc = 35.4
    @email_renewals = 17
  end
end

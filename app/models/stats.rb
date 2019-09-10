# frozen_string_literal: true

class Stats
  # include CanCan::Ability

  attr_reader :new_reg, :assisted_pc, :email_renewals

  def initialize()
    @new_reg = 25
    @assisted_pc = 35.4
    @email_renewals = 17
  end

  private

  def private()
    return "Doing something private"
  end
end

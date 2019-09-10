# frozen_string_literal: true

class StatsController < ActionController::Base

  # new_reg = The total number of new registrations (not including email renewals) in the past week.

  # assisted_pc = The ratio of (fully assisted and partially assisted) to (total of new registrations and renewals)
  # as a percentage to one decimal place.

  # email_renewals = The total number of renewals by email in the past week.

  protect_from_forgery with: :exception

  def index
    stats = Stats.new

    render json: {
      new_reg: stats.new_reg,
      assisted_pc: stats.assisted_pc,
      email_renewals: stats.email_renewals
    }
  end

end

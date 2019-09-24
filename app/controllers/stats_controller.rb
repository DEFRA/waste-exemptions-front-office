# frozen_string_literal: true

class StatsController < ApplicationController

  # new_reg = The total number of new registrations (not including email renewals) in the past week.

  # assisted_pc = The ratio of (fully assisted and partially assisted) to (total of new registrations and renewals)
  # as a percentage to one decimal place.

  # email_renewals = The total number of renewals by email in the past week.

  def index
    stats = Stats::StatsFormatter.new

    render json: stats.json
  end
end

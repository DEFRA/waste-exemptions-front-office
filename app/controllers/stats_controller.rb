# frozen_string_literal: true

class StatsController < ActionController::Base

  def index
    render :json => {
      :new_reg => 25,
      :assisted_pc => 35.4,
      :email_renewals => 17
    }
  end

end

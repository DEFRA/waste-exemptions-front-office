# frozen_string_literal: true

class StatsController < ActionController::Base

  protect_from_forgery with: :exception

  def index    
    render json: {
      new_reg: 25,
      assisted_pc: 35.4,
      email_renewals: 17
    }
  end

end

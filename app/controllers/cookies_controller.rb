# frozen_string_literal: true

class CookiesController < ApplicationController
  def accept_analytics
    write_cookie(:cookies_policy, :analytics_accepted)
    redirect_back fallback_location: "/"
  end

  def reject_analytics
    write_cookie(:cookies_policy, :analytics_rejected)
    redirect_back fallback_location: "/"
  end

  def hide_this_message
    write_cookie(:cookies_preferences_set, true)
    redirect_back fallback_location: "/"
  end

  protected

  def write_cookie(name, value)
    cookies[name] =
      {
        value: value,
        expires: 1.year
      }
  end
end

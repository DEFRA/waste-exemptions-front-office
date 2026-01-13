# frozen_string_literal: true

require "secure_headers"

# A CSP is delivered via a HTTP response header, much like HSTS, and defines
# approved sources of content that the browser may load. It can be an
# effective countermeasure to Cross Site Scripting (XSS) attacks and is
# also widely supported and usually easily deployed.
# https://scotthelme.co.uk/content-security-policy-an-introduction/
#
# See the following for reference on CSP
# https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP
#
# See the following for reference on secure_headers and its configuration
# https://github.com/twitter/secureheaders#configuration
#
# This is based on our CSP config for pafs_core
# https://github.com/DEFRA/pafs_core

SecureHeaders::Configuration.default do |config|
  # Specifically here we are saying
  # - scripts can only come from the service
  # - fonts can only come from the service, or via the data: scheme
  # - send any violation reports to a service we have setup for CSP
  # - for all other items their source must be the service (default-src)
  #
  # The following were used for reference
  # https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/script-src
  # https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/font-src
  #
  # We have to use single quotes here, even though it's against style - double doesn't work
  # rubocop:disable Lint/PercentStringArray
  config.csp = {
    connect_src: %w['self'],
    default_src: %w['self'],
    font_src: %w['self' data:],
    img_src: %w['self'],
    object_src: %w['self'],
    script_src: %w['self'],
    style_src: %w['self'],
    report_uri: %w[https://environmentagency.report-uri.io/r/default/csp/enforce]
  }
  # rubocop:enable Lint/PercentStringArray

  config.x_content_type_options = "nosniff"
  config.x_frame_options = "SAMEORIGIN"
  config.x_xss_protection = "1; mode=block"
end

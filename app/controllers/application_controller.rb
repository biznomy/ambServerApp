class ApplicationController < ActionController::Base
  
  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    Rails.logger.debug("set_csrf_cookie_for_ng called FAT:#{form_authenticity_token}")
    Rails.logger.debug("protect_against_forgery = #{protect_against_forgery?}")
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected
  def verified_request?
    Rails.logger.debug("verified_request called f_a_t:#{form_authenticity_token}. X-XSRF-TOKEN:#{request.headers['X-XSRF-TOKEN']}")
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
  
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers


  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
   
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
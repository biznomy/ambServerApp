class Driver::V1::ApplicationController < ApplicationController
	#protect_from_forgery with: :null_session
	before_filter :authenticate_driver_from_token!
  #before_filter :authenticate_user!
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


  private
  def authenticate_driver_from_token!
    if !params[:auth_token].blank? and !current_driver.blank?
      driver_email = current_driver.email
      driver = driver_email && Driver.find_by_email(driver_email)
      if driver.authentication_token == params[:auth_token]
        sign_in driver
      else
        render :status => 200,
               :json => { :code => 1,
               :error => "HTTP Token: Access denied." }
      end
    else
      render :status => 200,
             :json => { :code => 1,
             :error => "please enter the valid auth_token." }
    end
  end
end

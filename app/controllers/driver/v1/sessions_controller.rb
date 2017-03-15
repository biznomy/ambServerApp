class Driver::V1::SessionsController < Devise::SessionsController
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
  prepend_before_filter :require_no_authentication, :only => [:create ]
  before_filter :ensure_params_exist
  respond_to :json
  skip_before_filter :verify_authenticity_token


  def create
    resource = Driver.find_for_database_authentication(:email => params[:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:password])
      sign_in("driver", resource)
      resource.ensure_authentication_token
      render :status => 200,
      :json=> {:code=>0, :auth_token=>resource.authentication_token}
      
      return
    end
    invalid_login_attempt
  end


  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_driver.update_column(:authentication_token, nil)
    sign_out
    render :status => 200,
           :json => { :code => 0
           }
  end


  protected
  def ensure_params_exist
    return unless params[:email].blank?
    render :status => 200,
           :json => { :code => 1,
                      :messages => "missing user_login parameter"}
  end


  def invalid_login_attempt
    warden.custom_failure!
    render :status => 200,
           :json => { :code => 1,
                      :messages => "Login Credentials Failed"}
  end
end
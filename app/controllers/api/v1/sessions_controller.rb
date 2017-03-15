class Api::V1::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  #before_filter :ensure_params_exist
  respond_to :json
  skip_before_filter :verify_authenticity_token


  def create
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in("user", resource)
      resource.ensure_authentication_token
      render :status => 200,
      :json => { :code => 0,
                 :user => current_user
      }
      
      return
    end
    invalid_login_attempt
  end



  def destroy
    #binding.pry
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure") 
    current_user.update_column(:authentication_token, nil)
    sign_out
    render :status => 200,
           :json => { :code => 0
           }
  end


  protected
  def ensure_params_exist
    return unless params[:user][:email].blank?
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
class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json


  def create
    build_resource(sign_up_params)
    resource.skip_confirmation!
    resource.userprofile=Userprofile.new
    if resource.save
      sign_in resource
      render :status => 200,
           :json => { :code => 0,
                      :messages => "successfully signed up",
                      :data => { :user => resource} }
    else
      render :status => 201,
             :json => { :code => 1,
                        :messages => resource.errors}
    end
  end

  

  private 

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
class Api::V1::ApplicationController < ApplicationController
	#protect_from_forgery with: :null_session
  #before_filter :authenticate_user!
	before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    #binding.pry
    if !params[:auth_token].blank? and !current_user.blank?
      user_email = current_user.email
      user = user_email && User.find_by_email(user_email)
      if user.authentication_token == params[:auth_token]
       sign_in user
      else
       render :status => 200,
              :json => { :code => 1,
              :errors => "HTTP Token: Access denied." }
              
      end
    else
      render :status => 200,
             :json => { :code => 1,
             :errors => "please enter the vaild auth_token." }
    end
  end

  before_filter :user
  # binding.pry
  def user
    Sessionuser.current = current_user
  end
  
end

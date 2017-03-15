class Api::V1::UsersController < Api::V1::ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def edit
    respond_to do |format|
      @user.userprofile.full_name = params['full_name'];
      @user.userprofile.address = params['address'];
      if @user.save
        #format.html { redirect_to admin_user_path(@user), notice: 'user was successfully updated.' }
        format.json { render :status => 200,
                     :json => { :code => 0,
                      :messages => "successfully updated" } }
      else            
        format.json { render :status => 200,
                    json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def details
   @users=User.where(id: current_user.id)
  end

    
  def medicalinfo
    @user = User.find(current_user.id)
    respond_to do |format|    
      @user.userprofile.medical_info = params['medical_info'];
      if @user.save
        #format.html { redirect_to admin_user_path(@user), notice: 'user was successfully updated.' }
        format.json { render :status => 200,
                         :json => { :code => 0,
                         :messages => "successfully updated" } }
      else            
        format.json { render :status => 200,
                        json: @user.errors, status: :unprocessable_entity }
      end
     end
  end


  def  medicalinfodetails
    #binding.pry
    @medicaldetails=User.where(id: current_user.id)
   end

  def changepassword  
    @user = User.find(current_user.id)
    respond_to do |format|
      data=@user.valid_password?(params[:old_password])
      @user.password = params['password'];
      if data==true
        if @user.save 
          sign_in(@user, :bypass => true)
          #format.html { redirect_to admin_user_path(@user), notice: 'user was successfully updated.' }
          format.json { render :status => 200,
                     :json => { :code => 0,
                      :messages => "successfully updated" } }
        else
          format.json { render :status => 200,
                    json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.json { render :status => 200,
                    :json => { :code => 1,
                      :messages => "not match old password" } }
      end
    end
  end 




  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end


  private

  def set_user
    #binding.pry
    @user = User.find(current_user.id)
  end

end
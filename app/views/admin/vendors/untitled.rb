def changepassword
    
    @user = User.find(current_user.id)
    respond_to do |format|
data=user.valid_password?(params[:user][:password])
      @user.password = params['password'];
#binding.pry
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
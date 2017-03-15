class Admin::UsersController < Admin::ApplicationController
  layout 'admin/application.html.erb'
  before_filter :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index   
    #binding.pry
    if current_admin.role=="vendor"
     redirect_to admin_bookings_path
     return true 
    end

    @users = User.list(params)  
    respond_to do |format|
      format.html
      format.csv { send_data @users.as_csv }   
    end  
  end


  def new
    @user = User.new
    @user.userprofile=Userprofile.new
  end


  def edit

  end

  def create
   @user = User.new(user_params) 
   @user.userprofile=Userprofile.new
   respond_to do |format|
     if @user.save
       format.html { redirect_to admin_users_url, notice: 'user was successfully created.' }
       else
       format.html { render :new }
      end
    end
  end



  def update
    respond_to do |format|
     if @user.update(user_params)
       format.html { redirect_to :controller => "users", :action => "edit", :id =>@user.id, notice: 'user was successfully updated.' }
       else
        format.html { render :edit }
      end
    end
  end


  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @user.destroy
    delete
  end



  def destroy_multiple
   User.destroy(params[:users])
   delete
  end


  private
  
  def set_user
    @user = User.find(params[:id])
  end


  def set_userprofile
    @userprofile = Userprofile.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:email, :password,userprofile_attributes:[:id,:full_name,:medical_info,:address])
  end


  def updateuser_params
    params.require(:user).permit(:email, userprofile_attributes:[:id,:full_name,:medical_info,:address])
  end


  def delete
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'user was successfully destroyed.' }
    end
    return true
  end

end
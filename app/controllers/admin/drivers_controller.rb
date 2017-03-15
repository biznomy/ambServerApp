class Admin::DriversController < Admin::ApplicationController
  #layout 'admin/application.html.erb'
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  before_filter :get_vendor

  def get_vendor
    if params[:vendor_id].blank?
    else
     @vendors = Vendor.find(params[:vendor_id])  
    end
  end


  def index
    @drivers = Driver.list(params)
  end

  def select_drivers
   # binding.pry
   @drivers = Driver.where(:vendor_id=>params[:id])
   #binding.pry
  end


  # GET /drivers/1
  # GET /drivers/1.json
  def show

  end

  # GET /drivers/new
  def new
   @driver = Driver.new
   @driver.driverprofile=Driverprofile.new
  end


  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)
    @driver.driverprofile=Driverprofile.new
    respond_to do |format|
      if @driver.save
        #binding.pry
        if current_admin.role =='vendor'
         format.html { redirect_to admin_drivers_url, notice: 'Driver was successfully created.' }
        else
         # binding.pry
         format.html { redirect_to admin_vendor_drivers_path, notice: 'Driver was successfully created.' }
        end
      else
        format.html { render :new }
      end
    end
  end


  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(updatedriver_params)
        if current_admin.role ='vendor'
         format.html { redirect_to :controller => "drivers", :action => "edit",:id =>@driver.id, notice: 'Driver was successfully updated.' }
        else
         format.html { redirect_to :controller => "drivers", :action => "edit",:vendor_id =>@vendor.id, :id =>@driver.id, notice: 'Driver was successfully updated.' }
        end
      else
       format.html { render :edit }
      end
    end
  end



  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      if current_admin.role =='vendor'
       format.html { redirect_to admin_drivers_path, notice: 'Driver was successfully destroyed.' }  
      else
       format.html { redirect_to admin_vendor_drivers_path, notice: 'Driver was successfully destroyed.' }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_driver
    @driver = Driver.find(params[:id])
    #@vendors = Vendor.find(params[:vendor_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def driver_params
    #params.require(:driver).permit(:name,:vendor_id)
    params.require(:driver).permit(:email, :password,:vendor_id,driverprofile_attributes:[:id,:name])
  end


  def updatedriver_params
    #params.require(:driver).permit(:name,:vendor_id)
    params.require(:driver).permit(:email,:vendor_id,driverprofile_attributes:[:id,:name])
  end


end

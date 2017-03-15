class Admin::VendorsController < Admin::ApplicationController
  layout 'admin/application.html.erb'
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Admin.list(params)   
  end
  


  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @vendor = Admin.find(params[:id])
    #@vendor = Vendor.find(params[:id])
  end

  # GET /vendors/new
  def new
    @vendor = Admin.new
    @vendor.vendor=Vendor.new
  end

  # GET /vendors/1/edit
  def edit

  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Admin.new(vendor_params)
    @vendor.vendor=Vendor.new
    @vendor.role="vendor"
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to admin_vendors_url, notice: 'Vendor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update  
    respond_to do |format|
      if @vendor.update(updatevendor_params)
        format.html { redirect_to :controller => "vendors", :action => "edit", :id =>@vendor.id, notice: 'user was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy 
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to admin_vendors_url, notice: 'Vendor was successfully destroyed.' }
    end
  end


  def destroy_multiple
    Admin.destroy(params[:admins])
    respond_to do |format|
     format.html { redirect_to admin_vendors_url }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vendor    
    @vendor = Admin.find(params[:id])
  end
  

  # Never trust parameters from the scary internet, only allow the white list through.
  def vendor_params
    params.require(:admin).permit(:email, :password,vendor_attributes:[:id,:name,:avatar,:price,:termcondition,:description])
  end

  def updatevendor_params
    params.require(:admin).permit(:email,vendor_attributes:[:id,:name,:avatar,:price,:termcondition,:description])
  end    
  
end

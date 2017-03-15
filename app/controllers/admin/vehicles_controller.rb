class Admin::VehiclesController < Admin::ApplicationController
  #layout 'admin/application.html.erb'
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  # GET /vehicles
  # GET /vehicles.json
  before_filter :get_vendor

     
  def get_vendor
    if params[:vendor_id].blank?
    else
      @vendor = Vendor.find(params[:vendor_id])
     end
  end


  def index
    #binding.pry
    @vehicles = Vehicle.list(params)
  end


  def select_vehicles
    #binding.pry
    @vehicles = Vehicle.where(:vendor_id=>params[:id])
    # binding.pry
  end


  # GET /vehicles/1
  # GET /vehicles/1.json
  def show

  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
     
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    #binding.pry
    @vehicle = Vehicle.new(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        if current_admin.role =='vendor'
        format.html { redirect_to admin_vehicles_path, notice: 'Vehicle was successfully created.' }
        
      else
        format.html { redirect_to admin_vendor_vehicles_path, notice: 'Vehicle was successfully created.' }
        
      end
      else
        format.html { render :new }
       
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        if current_admin.role =='vendor'
         format.html { redirect_to :controller => "vehicles", :action => "edit",:id =>@vehicle.id, notice: 'Vehicle was successfully updated.' }      
        else
         format.html { redirect_to :controller => "vehicles", :action => "edit",:vendor_id =>@vendor.id, :id =>@vehicle.id, notice: 'Vehicle was successfully updated.' }
        end

      else
       format.html { render :edit }  
      end
    end
  end



  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      if current_admin.role =='vendor'
       format.html { redirect_to admin_vehicles_path, notice: 'Vehicle was successfully destroyed.' }    
      else
       format.html { redirect_to admin_vendor_vehicles_path, notice: 'Vehicle was successfully destroyed.' }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:number,:vendor_id,:addon_ids => [])
  end
  
end

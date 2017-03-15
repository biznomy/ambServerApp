class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  def sampleData1

    numUsers=3;
    numVendors=3;
    numVehiclesPerVendor=3;
    numDriverPerVendor=3;
    numBookingPerUser=3;

  

    #delete all data
    User.destroy_all  
    Admin.destroy_all

    @admin = Admin.new
    @admin.email="admin@admin.com"
    @admin.role="admin"
    @admin.password="abcdabcd"
    @admin.admin = true
    @admin.save


   (1..numVendors).each do |i| 
    vendortemp=i.to_s
    @vendor =  Admin.new
    @vendor.email="vendor"+vendortemp+"@gmail.com"
    @vendor.password="abcdabcd"
    @vendor.role="vendor"
    @vendor.vendor = Vendor.new
    @vendor.vendor.name="vendor"+vendortemp
    @vendor.vendor.price=1
    @vendor.vendor.termcondition="vendor "+vendortemp+" terms and conditions"
    @vendor.vendor.description="vendor "+vendortemp+" description"
    @vendor.save
    
      (1..numVehiclesPerVendor).each do |vehiclecnt| 
        vehiclecntstr = vehiclecnt.to_s
        @vehicle = Vehicle.new
        @vehicle.number = "Vehile"+vehiclecntstr+"OfVendor"+vendortemp
        @vehicle.vendor_id = @vendor.vendor.id
        @vehicle.save
      end 

      (1..numDriverPerVendor).each do |drivercnt| 
        drivercntstr = drivercnt.to_s
        @driver = Driver.new
        @driver.email = "driver"+drivercntstr+"vendor"+vendortemp+"@gmail.com"
        @driver.password = "abcdabcd"
        @driver.driverprofile = Driverprofile.new
        @driver.driverprofile.name = "driver"+drivercntstr+"OfVendor"+vendortemp
        @driver.vendor_id = @vendor.vendor.id
        @driver.save
      end 

    end

    (1..numUsers).each do |i| 
      usertemp = i.to_s
      @user = User.new
      @user.email="user"+usertemp+"@gmail.com"
      @user.password="abcdabcd"
      @user.userprofile = Userprofile.new
      @user.userprofile.full_name = "User"+usertemp
      @user.userprofile.medical_info = " Medical info of User"+usertemp
      @user.userprofile.address = " Address of User"+usertemp
      @user.save

      (1..numBookingPerUser).each do |numbooking|
        bookingstr = numbooking.to_s
        @booking = Booking.new
        @booking.date = "2014-10-30"
        @booking.fadd1 = "pitampura delhi"
        @booking.fadd2 = "nsp"
        @booking.tadd1 = "cp delhi"
        @booking.tadd2 = "palika"
        @booking.user = @user
        vendorstr = "vendor"+bookingstr+"@gmail.com"
        admin = Admin.where(email: vendorstr)
        vehiclestr = "Vehile"+usertemp+"OfVendor"+bookingstr
        vehicle = Vehicle.where(number:vehiclestr)
        driverstr = "driver"+usertemp+"vendor"+bookingstr+"@gmail.com"
        driver = Driver.where(email:driverstr)

        @booking.vendor= admin[0].vendor
        @booking.vehicle = vehicle[0]
        @booking.driver = driver[0]
        @booking.save
  
      end 

    end

    respond_to do |format|
     format.json { render :status => 200,
                     :json => { :code => 0 }}
    end                 
  end  


  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])
    respond_to do |format|
     format.html
     format.pdf do
        pdf = BookingPdf.new(@booking)
        send_data pdf.render, filename: "booking.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
   end
  end


  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit

  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        BookingMailer.welcome_email(@booking).deliver
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:date, :fadd1, :tadd1,:user_id, :vendor_id,:vehicle_id,:driver_id)
  end
end

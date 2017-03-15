class Admin::BookingsController < Admin::ApplicationController
  layout 'admin/application.html.erb'
  before_filter :authenticate_admin!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # GET /bookings
  # GET /bookings.json
  autocomplete :vendor, :name
  def index
     @bookings = Booking.list(params)
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
        format.html { redirect_to admin_bookings_url, notice: 'Booking was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  # PATCH/PUT /bookings/1
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to :controller => "bookings", :action => "edit", :id =>@booking.id, notice: 'Booking was successfully updated.' }        
      else
        format.html { render :edit }
      end
    end
  end


  # DELETE /bookings/1
  def destroy
    @booking.destroy
    delete
  end


  def destroy_multiple
   Booking.destroy(params[:bookings])
   delete
  end


  private
 
  def set_booking
   @booking = Booking.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
   params.require(:booking).permit(:date, :fadd1 , :fadd2 , :fadd3, :tadd1 , :tadd2 , :tadd3, :user_id, :vendor_id,:vehicle_id,:driver_id,:status,:vehiclestatus,:breakdowndetails,:feedback,:paymentmode,:price,:specialnotes,:feedbackrating,:addon_ids => [] )
  end


  def delete
   respond_to do |format|
     format.html { redirect_to admin_bookings_url, notice: 'Booking was successfully destroyed.' }
     format.json { head :no_content }
    end
    return true
  end

end

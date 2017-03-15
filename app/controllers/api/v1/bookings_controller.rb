class Api::V1::BookingsController <Api::V1::ApplicationController
  before_filter :authenticate_user!, except: [:sampleData1]
  after_action only: [:index] { set_pagination_headers(:bookings) }
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers


  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  # GET /bookings
  # GET /bookings.json
  def index
    begin
      @bookings = Booking.currentuser(params).paginate(per_page: params[:per_page], page: params[:page])
    rescue
      respond_to do |format|
       #binding.pry 
      format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => @bookings.errors } }
      end  
    end
  end



  def monthyear
    #binding.pry
    begin
    @bookings = Booking.monthyear(params)
    rescue
      respond_to do |format|
        #binding.pry 
        format.json { render :status => 200,
                       :json => { :code => 1,
                       :bookings => @bookings.errors } }
      end  
    end
  end 


  def show
    
  end


  def new
    @booking = Booking.new
  end


  # GET /bookings/1/edit
  def edit
   # binding.pry
  end


  def cancel
    respond_to do |format|
      @booking = Booking.find(params[:id])
      @booking.status=params[:status]
      if @booking.save
       format.json { render :status => 200,
                     :json => { :code => 0,
                     :messages => "your booking cancel"} }
      else
        #binding.pry
        format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => @booking.errors } }
      end
    end
  end



  def feedback
    respond_to do |format|
     @booking = Booking.find(params[:id])
     @booking.feedback=params[:feedback]
     if @booking.save
       format.json { render :status => 200,
                     :json => { :code => 0,
                     :messages => "your feedback updated"} }
      else
       #binding.pry
       format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => @booking.errors } }  
      end
    end
  end



  def vehiclestatus
    respond_to do |format|
     @booking = Booking.find(params[:id])
     @booking.vehiclestatus=params[:vehiclestatus]
     @booking.breakdowndetails=params[:breakdowndetails]
     if @booking.save
       format.json { render :status => 200,
                     :json => { :code => 0,
                     :messages => "your vehicle status updated"} }
      else
       #binding.pry
       format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => @booking.errors } }
      end
    end
  end
  


  def create
    #binding.pry
    @booking = Booking.new(booking_params)
    respond_to do |format|
      @booking.save
      @account= Account.new
      @account.date=@booking.date
      @account.amount=@booking.price
      @account.vendor_id=@booking.vendor_id
      @account.remarks=@booking.id
      @account.booking_id=@booking.id
      if @account.save
        format.json { render :status => 200,
                     :json => { :code => 0,
                     :bookings =>{:id=> @booking.id,
                     :date=> @booking.date,
                     :user=>@booking.user_id,
                     :vendor=>@booking.vendor_id,
                     :fadd1=>@booking.fadd1,
                     :fadd2=>@booking.fadd2,
                     :tadd1=>@booking.tadd1,
                     :tadd2=>@booking.tadd2,
                     :paymentmode=>@booking.paymentmode,
                     :servicetype=>@booking.servicetype } } }
      else
        #binding.pry
        format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => @booking.errors } }
      end
    end
  end


  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    #binding.pry
    respond_to do |format|
      if @booking.update(booking_params)
        format.json { render :status => 200,
                     :json => { :code => 0,
                     :bookings =>{:id=> @booking.id,
                     :date=> @booking.date,
                     :user=>@booking.user_id,
                     :verdor=>@booking.vendor_id,
                     :fadd1=>@booking.fadd1,
                     :fadd2=>@booking.fadd2,
                     :tadd1=>@booking.tadd1,
                     :tadd2=>@booking.tadd2 } } }
      else
        format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => @booking.errors } }
      end
    end
  end



  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    #binding.pry
    @booking.destroy
    respond_to do |format|
      format.json { render :status => 200,
                     :json => { :code => 0,
                     :bookings => "successfully destroyed"} }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    # binding.pry
    @booking = Booking.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render json: { error: "data does not exist" }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:date, :fadd1,:fadd2,:fadd3, :tadd1,:tadd2,:tadd3, :user_id, :vendor_id,:vehicle_id,:driver_id,:paymentmode,:servicetype,:price,:specialnotes)
  end
  
end
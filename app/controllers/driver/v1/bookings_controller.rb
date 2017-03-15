class Driver::V1::BookingsController < Driver::V1::ApplicationController
  before_filter :authenticate_driver!
  before_filter :authenticate_driver_from_token!
  after_action only: [:index] { set_pagination_headers(:bookings) }
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index 
   begin
     if params[:date].blank?
       @bookings = Booking.where(driver_id: current_driver.id).paginate(per_page: params[:per_page], page: params[:page])
      else
        #binding.pry
        @bookings = Booking.where("driver_id= ? and date>= ? and date <= ?", "#{current_driver.id}","#{params[:date]} 00:00:00", "#{params[:date]} 23:59:59").paginate(per_page: params[:per_page], page: params[:page])
      end 
    rescue
      respond_to do |format| 
        format.json { render :status => 200,
                       :json => { :code => 1,
                       :bookings => "somthing error" } }
      end  
    end
  end



  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end
 
  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
end

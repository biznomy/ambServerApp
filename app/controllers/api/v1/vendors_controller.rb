class Api::V1::VendorsController < Api::V1::ApplicationController
  #render layout: false
  before_filter :authenticate_user!
  after_action only: [:index] { set_pagination_headers(:vendors) }
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    begin
      @vendors = Admin.list(params).paginate(per_page: params[:per_page], page: params[:page])
      #raise 'something'
    rescue
      respond_to do |format| 
       format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => "somthing error" } }
      end  
    end
  end
  
  def show

  end
 
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vendor   
    begin  
      @vendor = Admin.find(params[:id])
    rescue  
      respond_to do |format| 
        format.json { render :status => 200,
                     :json => { :code => 1,
                     :bookings => "somthing error" } }
      end  
    end
  end      
end

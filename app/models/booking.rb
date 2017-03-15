class Booking < Allcommon 
  belongs_to :user
  belongs_to :vendor
  belongs_to :driver
  belongs_to :vehicle
 
  has_many :bookingaddons
  has_many :addons, through: :bookingaddons

  accepts_nested_attributes_for :addons
  validates_presence_of :fadd1,:fadd2,:tadd1 ,:tadd2
  STATUS_TYPES = ["0", "1","2"]
  VEHICLE_TYPES = ["0","1","2","3","4"]
  PAYMENT_MODE = ["select","0","1"]
    
  
  def self.list(params)      
  
    if params[:f_date].blank? and params[:to_date].blank? and params[:vendor_id].blank? and params[:vehicle_id].blank? and params[:driver_id].blank? and params[:user_id].blank? and params[:date].blank?	
     #binding.pry
     #sleep(3)
     if Sessionadmin.current.role =='vendor' 
        @vendor = Vendor.where(admin_id: Sessionadmin.current.id)
        bookings = Booking.where(vendor_id: @vendor)
        else
         bookings = Booking.all
      end

    else	
    	bookings = Booking.all
      
      #binding.pry
		  if !params[:vendor_id].blank?
			  bookings = bookings.where("vendor_id like ?","#{params[:vendor_id]}")	
		  end	

		  if !params[:vehicle_id].blank?
			 bookings = bookings.where("vehicle_id like ?","%#{params[:vehicle_id]}%")	
		  end	
		
		  if !params[:driver_id].blank?
			 bookings = bookings.where("driver_id like ?","%#{params[:driver_id]}%")	
		  end	
      #binding.pry
		  if !params[:f_date].blank?
    	 bookings = bookings.where("date >= ?", "#{params[:f_date]} 00:00:00")
    	end

		  if !params[:to_date].blank?
    	 bookings = bookings.where("date <= ?", "#{params[:to_date]} 23:59:59")
      end

      if !params[:user_id].blank?
       bookings = bookings.where("user_id like ?","#{params[:user_id]}") 
      end 

      if !params[:date].blank?
        #binding.pry
       bookings = bookings.where("date like ?" ,"#{params[:date]}") 
      end 
    end
   
    return bookings.page_config(params)
  end

  def self.currentuser(params)
    user=Sessionuser.current
    if params[:date].blank?
     bookings = where(user_id:user.id)
    else
     #bookings = where("date between ? and ?", "#{params[:date]}", "#{params[:date]}") 
     bookings=where("user_id= ? and date>= ? and date <= ?", "#{user.id}","#{params[:date]} 00:00:00", "#{params[:date]} 23:59:59")   
    end
    return bookings
  end


  def self.monthyear(params)
    user=Sessionuser.current
   #binding.pry
    bookings = where("user_id= ? and date like ?","#{user.id}","%#{params[:month_year]}%") 
    aaa=bookings.group_by{ |c| c.date.strftime("%d") }
    return aaa
    #binding.pry
  end
   def vendor_name
   
  end


end

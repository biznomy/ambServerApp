class Bookingaddon < ActiveRecord::Base
	
  belongs_to :booking
  belongs_to :addon
  
end

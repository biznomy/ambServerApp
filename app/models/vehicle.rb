class Vehicle < Allcommon
	belongs_to :vendor
	has_many :bookings, dependent: :destroy

	has_many :vehicleaddons
  has_many :addons, through: :vehicleaddons

  validates_presence_of :number 

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("number like ?", "%#{query}%") 
  end

  def self.list(params)
  	data=Sessionadmin.current
   if data.role =='vendor' 
      @vendor = Vendor.where(admin_id: data.id)
      vehicles = Vehicle.where(vendor_id: @vendor)
    else
     vehicles = Vehicle.all

     if params[:vendor_id].blank?

      else
       vehicles = Vehicle.where(vendor_id: params[:vendor_id])
      end
    end
   return vehicles.page_config(params).pagesearch(params)
  end
end

class Driver < Allcommon
  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :token_authenticatable #,:confirmable
  def skip_confirmation!
    self.confirmed_at = Time.now
  end
  belongs_to :vendor
	has_many :bookings, dependent: :destroy 
  has_one :driverprofile, dependent: :destroy
  accepts_nested_attributes_for :driverprofile

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("email	 like ?", "%#{query}%") 
  end

  def self.list(params)    
    data=Sessionadmin.current
    if data.role =='vendor' 
      @vendor = Vendor.where(admin_id: data.id)
      drivers = Driver.where(vendor_id: @vendor)
    else
      drivers = Driver.page_config(params).pagesearch(params)
      if params[:vendor_id].blank?
      else
        drivers =Driver.where(vendor_id: params[:vendor_id])
      end
    end
    return drivers.page_config(params).pagesearch(params)
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Driver.where(authentication_token: token).first
    end
  end
  
end

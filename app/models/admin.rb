class Admin < Allcommon
  has_one :vendor, dependent: :destroy
  #cattr_accessor :current_admin
  accepts_nested_attributes_for :vendor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable #,:registerable



  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("email like ?", "%#{query}%") 
  end

	def self.list(params)
	  #binding.pry
    vendors=where("role like ?", "vendor") 	
    return vendors.page_config(params).pagesearch(params)
  end	
   
end

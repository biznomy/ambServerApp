class User < Allcommon
  #binding.pry
  validates_presence_of :email
  #validates_presence_of :password_confirmation , :on => :create
  before_save :ensure_authentication_token
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,
        :token_authenticatable #,:confirmable

      

  def skip_confirmation!
    self.confirmed_at = Time.now
  end

  
  has_many :bookings, dependent: :destroy
  has_one :userprofile, dependent: :destroy
  accepts_nested_attributes_for :userprofile
  def self.search(query)
   where("email like ?", "%#{query}%") 
  end


  def self.as_csv
    csv_string = CSV.generate do |csv|
        csv << ["Id","Email","name","address","medical_info"]
         all.each do |user|
          #binding.pry
           csv << [user.id, user.email,user.userprofile.full_name,user.userprofile.address,user.userprofile.medical_info]
          end
        end
  end   

  def self.list(params)
    users=User.all
    return dada=users.page_config(params).pagesearch(params)
  end

   
  def self.current=(user)
    Thread.current['user'] = user.try(:id)
  end
    
  def self.current
    @@current ||= User.find_by_id(Thread.current['user'])
  end
end

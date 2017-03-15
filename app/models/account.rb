class Account < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :booking

  def self.search(params)
    where("vendor_id like ?", "%#{params[:search]}%") 
  end
end

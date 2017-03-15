class Sessionadmin < Allcommon 
  def initialize
    @@current = nil
  end 

  def self.current=(admin)
    #binding.pry
    @@current=admin
  end
    
 def self.current
   #binding.pry
   @@current 
 end 
end

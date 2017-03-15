class Sessionuser < Allcommon
   
  def initialize
    @@current = nil
  end 

  def self.current=(user)
    #binding.pry
    @@current=user
  end
    
  def self.current
   #binding.pry
   @@current 
  end
       
  
end
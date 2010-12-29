class DsaDetail < ActiveRecord::Base
  belongs_to :country
  
  def self.dropdown
  
    opts = []
    Country.all.each do |countr|
      countrya = []
      countrya << countr.name
      
      city = []
      
      countr.dsa_details.each do |dsa|
        city << [dsa.city,dsa.id]
      end
      
      countrya << city      
      opts << countrya
    end
    
  opts
    
  end
end

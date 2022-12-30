class Hospital < ApplicationRecord 
  def self.search(city, state, zip)
    Hospital.where("city ILIKE? AND state ILIKE? AND zip ILIKE?", "%#{city}%", "%#{state}%", "%#{zip}%" )
  end
end
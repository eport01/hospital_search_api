class Hospital < ApplicationRecord 
  def self.search(state, zip)
    Hospital.where("state ILIKE? AND zip ILIKE?", "%#{state}%",  "%#{zip}%" )
  end
end
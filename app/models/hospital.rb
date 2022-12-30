class Hospital < ApplicationRecord 
  def self.search(state)
    Hospital.where("state ILIKE?", "%#{state}%" )
  end
end
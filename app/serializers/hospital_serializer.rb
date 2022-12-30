class HospitalSerializer 
  include JSONAPI::Serializer 
  attributes :name, :address, :city, :state, :zip, :beds, :trauma  
end
require 'rails_helper'

describe "Hospitals API" do 
  describe 'api/v1/hospitals' do 

    it 'send a list of hospitals' do 
      create_list(:hospital, 3)

      get '/api/v1/hospitals'

      expect(response).to be_successful 
      hospitals = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(hospitals.count).to eq(3)

      hospitals.each do |hospital|
        expect(hospital).to have_key(:id)
        expect(hospital[:id].to_i).to be_an(Integer)

        expect(hospital[:attributes]).to have_key(:name)
        expect(hospital[:attributes]).to have_key(:address)
        expect(hospital[:attributes]).to have_key(:city)
        expect(hospital[:attributes]).to have_key(:state)
        expect(hospital[:attributes]).to have_key(:zip)
        expect(hospital[:attributes]).to have_key(:beds)
        expect(hospital[:attributes]).to have_key(:trauma)
        expect(hospital[:attributes]).to have_key(:hospital_id)
      end


    end

  end

  describe 'api/v1/hospitals/hospital_id' do 
    it 'can return one hospitals data by id' do 
      hospital = create(:hospital, hospital_id: 40)
      other_hospital = create(:hospital, hospital_id: 30)

      get "/api/v1/hospitals/#{hospital.hospital_id}"

      one_hospital = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(one_hospital[:attributes][:hospital_id]).to eq(hospital.hospital_id)
      expect(one_hospital[:attributes][:name]).to eq(hospital.name)
      expect(one_hospital[:attributes][:name]).to_not eq(other_hospital.name)
    end
  end
end
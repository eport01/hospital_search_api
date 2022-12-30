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

    it 'returns an error and status 404 if hospital id is invalid' do 
      get "/api/v1/hospitals/25"

      expect(response).to have_http_status 404

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("invalid hospital ID")
    end
  end

  describe 'api/v1/hospitals/search?' do 
    it 'returns all hospitals by city and state' do 
      hospital = create(:hospital, city: "Denver", state: "CO")
      hospital2 = create(:hospital, city: "Denver", state: "CO")
      hospital3 = create(:hospital, city: "Los Angelos", state: "LA", zip: "90210")


      get "/api/v1/hospitals/search?city=Denver&state=CO"

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful

      expect(results.count).to eq(2)

      expect(results[0][:attributes][:name]).to eq(hospital.name)
      expect(results[1][:attributes][:name]).to eq(hospital2.name)

      expect(results[0][:attributes][:city]).to eq(hospital.city)
      expect(results[1][:attributes][:city]).to eq(hospital2.city)
    end
  end


end
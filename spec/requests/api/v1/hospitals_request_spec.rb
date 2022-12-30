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
end
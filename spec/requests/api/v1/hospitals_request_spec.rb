require 'rails_helper'

describe "Hospitals API" do 
  describe 'api/v1/hospitals' do 

    it 'send a list of hospitals' do 
      create_list(:hospital, 3)

      get '/api/v1/hospitals'

      expect(response).to be_successful 
      hospitals = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(hospitals.count).to eq(3)
    end

  end
end
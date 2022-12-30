require 'rails_helper' 

describe "Hospital Search API endpoints" do 
  describe 'api/v1/hospitals/search?state=hospital.state' do 
    it 'returns all hospitals from a certain state after search' do 
      hospital = create(:hospital, state: "CO")
      hospital2 = create(:hospital, state: "CO")

      get "/api/v1/hospitals/search?state=CO"

      results = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful


    end
  end
end
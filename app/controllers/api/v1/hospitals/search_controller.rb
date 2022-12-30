class Api::V1::Hospitals::SearchController 
  def search 
    if params[:state] || params[:name] ||params[:address] || params[:city] || params[:zip]
      hospitals = Hospital.search(params[:state], params[:name], params[:address], params[:city], params[:zip])
      render json: HospitalSerializer.new(hospitals)
    else 
      render json: {error: "you must supply at elast one search parameter"}, status: 404
    end
  end
end
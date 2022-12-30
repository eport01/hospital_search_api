class Api::V1::HospitalsController < ApplicationController
  def index 
    render json: HospitalSerializer.new(Hospital.all)
  end

  def show 
    hospital = Hospital.find_by(params[:hospital_id])

    if hospital
      render json: HospitalSerializer.new(hospital)
    else
      render json: {error: "invalid hospital ID"}, status: 404
    end
  end

  def search 
    if params[:state]
      hospitals = Hospital.search(params[:state])
      render json: HospitalSerializer.new(hospitals)
    else 
      render json: {error: "you must supply at least one search parameter"}, status: 404
    end
  end
end

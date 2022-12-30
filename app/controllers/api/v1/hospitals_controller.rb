class Api::V1::HospitalsController < ApplicationController
  def index 
    render json: HospitalSerializer.new(Hospital.all)
  end
end

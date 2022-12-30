class AddHospitalIdToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :hospital_id, :string
  end
end

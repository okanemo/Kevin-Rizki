class AddPartnumberToPatientLabs < ActiveRecord::Migration[6.0]
  def change
    add_index :patient_labs, :id_number
    add_index :patient_labs, :code
  end
end

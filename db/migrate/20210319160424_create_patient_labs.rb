class CreatePatientLabs < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_labs do |t|
      t.string :id_number, 
      t.string :patient_name, 
      t.string :phone_mobile
      t.string :gender, 
      t.string :date_of_birth, 
      t.string :date_of_test, 
      t.string :lab_number, 
      t.string :clinic_code, 
      t.string :code, 
      t.string :name, 
      t.string :value, 
      t.string :unit, 
      t.string :ref_range, 
      t.string :finding, 
      t.string :result_state, 

      t.timestamps
    end
  end
end

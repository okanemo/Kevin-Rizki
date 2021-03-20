class PatientLab < ApplicationRecord
    validates :id_number, :patient_name, :gender, :date_of_birth, presence: true  
    validates :id_number, uniqueness:
        {message: 'already exists'}
end

class PatientLab < ApplicationRecord
    validates :id_number, :patient_name, :gender, :date_of_birth, presence: true, on: :blank 
    validates :id_number, uniqueness:
        {message: 'already exists'}
end

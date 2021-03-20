class Api::PatientLabsController < ActionController::API
  
    def index
        render json: PatientLab.all
    end
  
    def create
        patient_lab = PatientLab.create(patient_lab_params)
        
        if patient_lab.valid?
            render json: patient_lab, status: :created
        else
            render json: {errors: patient_lab.errors.full_messages},
            status: :not_acceptable
        end
            
    end
    
    private
    
    def patient_lab_params
        params_parse = {}
        if params["patient_data"] == nil
            params_parse = parse_case_1(params)
        else
            params_parse = parse_case_2(params)
        end
        
        params_parse
    end

    def parse_case_1(params)
        params_parse = {}

        params_parse["id_number"]     = params[:id_number]
        params_parse["patient_name"]  = params[:patient_name]
        params_parse["phone_mobile"]  = params[:phone_mobile]
        params_parse["gender"]        = params[:gender]
        params_parse["date_of_birth"] = params[:date_of_birth]
        params_parse["date_of_test"]  = params[:date_of_test]
        params_parse["lab_number"]    = params[:lab_number]
        params_parse["clinic_code"]   = params[:clinic_code]
        params_parse["code"]          = params[:lab_studies][0][:code]
        params_parse["name"]          = params[:lab_studies][0][:name]
        params_parse["value"]         = params[:lab_studies][0][:value]
        params_parse["unit"]          = params[:lab_studies][0][:unit]
        params_parse["ref_range"]     = params[:lab_studies][0][:ref_range]
        params_parse["finding"]       = params[:lab_studies][0][:finding]
        params_parse["result_state"]  = params[:lab_studies][0][:result_state]

        return params_parse
    end

    def parse_case_2(params)
        params_parse = {}

        params_parse["id_number"]     = params[:patient_data][:id_number]
        params_parse["patient_name"]  = "#{params[:patient_data][:first_name]} #{params[:patient_data][:last_name]}"
        params_parse["phone_mobile"]  = params[:patient_data][:phone_mobile]
        params_parse["gender"]        = params[:patient_data][:gender]
        params_parse["date_of_birth"] = params[:patient_data][:date_of_birth]
        params_parse["date_of_test"]  = params[:date_of_test]
        params_parse["lab_number"]    = params[:lab_number]
        params_parse["clinic_code"]   = params[:clinic_code]
        params_parse["code"]          = params[:lab_studies][0][:code]
        params_parse["name"]          = params[:lab_studies][0][:name]
        params_parse["value"]         = params[:lab_studies][0][:value]
        params_parse["unit"]          = params[:lab_studies][0][:unit]
        params_parse["ref_range"]     = params[:lab_studies][0][:ref_range]
        params_parse["finding"]       = params[:lab_studies][0][:finding]
        params_parse["result_state"]  = params[:lab_studies][0][:result_state]

        return params_parse
    end
end

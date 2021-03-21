require 'test_helper'

class PatientLabsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_labs_index_url
    assert_response :success
  end

end

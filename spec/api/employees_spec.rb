require 'rails_helper'

RSpec.describe 'employees API', type: :request do

  let!(:employees) { create_list(:employee, 3) }

  let!(:services) { create_list(:service, 3) }
  let(:service_id) { services.first.id }
  let!(:service_schedules) { create_list(:service_schedule, 3,service_id: service_id, availability_date: DateTime.current) }

  # Test suite for GET /api/projects
  describe 'GET /api/employees' do
    # make HTTP get request before each example

    before do
      get '/api/employees/'
    end


    it 'returns employees' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to be >= 0
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end



    # Test suite for POST /api/employees/scheduler
    describe 'POST /api/employees/scheduler' do
      # valid payload
      let(:valid_attributes) { 
        {
          schedules: [{id:1, scheduleId:1}],
          serviceId: 1
        }
       }
  
      context 'when the request is valid' do
        before do 
          post "/api/employees/scheduler", {schedules: [{id:1, scheduleId:1}],serviceId: 1},headers:{ 'CONTENT_TYPE' => 'application/json'}
        end
  
        it 'all data is present' do
          expect(json['success']).to be_truthy
        end
  
        it 'returns status code 201' do
        
          expect(response).to have_http_status(201)
        end
      end
  
      context 'when the request is invalid' do
        before { post '/api/employees/scheduler',  { serviceId: '' , schedules:[] },headers:{'CONTENT_TYPE' => 'application/json' }}
  
       
  
        it 'returns status code 400' do
          expect(response).to have_http_status(400)
        end
  
        it 'returns a validation failure message' do
          expect(json["success"])
            .to be_falsey
        end
      end
    end


end
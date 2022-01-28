require 'rails_helper'

RSpec.describe 'services API', type: :request do

  let!(:services) { create_list(:service, 3) }
  let(:service_id) { services.first.id }
  let!(:service_schedules) { create_list(:service_schedule, 3,service_id: service_id) }

  # Test suite for GET /api/projects
  describe 'GET /api/services' do
    # make HTTP get request before each example

    before do
      get '/api/services/'
    end


    it 'returns services' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to be >= 0
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /api/services/:service_id/schedules' do
    # make HTTP get request before each example

    before do
      get "/api/services/#{service_id}/schedules"
    end


    it 'returns schedules of service' do
      # Note `json` is a custom helper to parse JSON responses
      p response
      expect(json).not_to be_empty
      expect(json.size).to be >= 0
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
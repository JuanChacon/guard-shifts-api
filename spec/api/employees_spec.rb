require 'rails_helper'

RSpec.describe 'employees API', type: :request do

  let!(:employees) { create_list(:employee, 3) }

  # Test suite for GET /api/projects
  describe 'GET /api/employees' do
    # make HTTP get request before each example

    before do
      get '/api/employees/'
    end


    it 'returns employees' do
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
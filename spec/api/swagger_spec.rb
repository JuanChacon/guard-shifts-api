require 'rails_helper'
RSpec.describe 'Swagger API', type: :request do
  describe 'Swagger API docs', type: :request do
    describe 'all the paths' do

      before do
        get '/api/swagger_doc'
      end

      it 'responds with swagger for all the apis' do
       
        result = JSON(response.body)
        expect(response.code).to eq('200')
      end
    end
  end
end
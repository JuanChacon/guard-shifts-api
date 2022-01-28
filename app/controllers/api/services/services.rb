# frozen_string_literal: true

module API
  module Services
    class Services < Grape::API
      #  format 'json'
      include API::Base

      resource :services do
        desc 'Return all the services'
        get '/' do
          Service.all
        end


        desc 'Return all schedules by service'
        params do 
           requires :id, type: Integer, desc: "Id of service"
        end
        route_param :id do
            get '/schedules' do 
                service = Service.find(params[:id])

                 service.service_schedules
                

            end
        end
      end
    end
  end
end

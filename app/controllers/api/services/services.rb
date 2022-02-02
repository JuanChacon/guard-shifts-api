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
          requires :id, type: Integer, desc: 'Id of service'
        end
        route_param :id do
          route_param :week_no do
            get '/schedules' do
              week_no = params[:week_no]
              service = Service.find(params[:id])

              #service.service_schedules.where("WEEK(service_schedules.availability_date) = #{week_no}")
              schedules = service.week_schedule_by_week(week_no)
              schedules_group_by_date =  schedules.order(availability_date: :asc).group_by{|svce_schedule| svce_schedule.availability_date.strftime('%Y-%m-%d').downcase}

              schedules = schedules_group_by_date.to_a.map do |data|
                date = Date.parse("#{data[0]}")
                obj = {}
                obj[:key] = date.strftime('%d').to_i
                obj[:title] = "#{I18n.t("date.day_names")[date.strftime('%w').to_i]} #{date.strftime('%d del %Y')} "
                obj["dates"] = data[1].map do |svce_schedule|
                  svce_schedule.date_details
                end
                [obj]
              end
                {
                  schedules: schedules,
                  week: service.dates_from_week(week_no) 

                }
            end
          end
        end


        desc "service schedule"
        params do
          requires :id, type: Integer, desc: 'Id of service'
          requires :weekNo,as: :week_no, type: String, desc: 'no of week'
        end
        route_param :id do
         get '/a' do
          employee = Service.find(params[:id]) 
         end 
        end  

      end
    end
  end
end

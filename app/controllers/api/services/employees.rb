module API
    module Services
        class Employees < Grape::API
             include API::Base
    
             resource :employees do
                desc 'Return all the personal'
                get '/' do
                    Employee.all
                end

                desc 'Create schedules per employee'
                params do
                  requires :schedules, type: Array do
                    requires :id,as: :employee_id, type: Integer, desc: "id of employee"
                    requires :scheduleId,as: :service_schedule_id, type: Integer, desc: "id of service_scheduler"
                  end
                  
                  requires :serviceId, as: :service_id, type: Integer
                end  
        
                post 'scheduler' do
                  if permitted_params["service_id"].present?
                    service = Service.find(permitted_params[:service_id])
                    logger.info permitted_params["schedules"].first
                    svce_schedule_id = permitted_params["schedules"].first["service_schedule_id"]
                    employee_id = permitted_params["schedules"].first["employee_id"]
                    week_of_service = ServiceSchedule.find(svce_schedule_id).week_of_service
                    hours_service = service.hours_service_by_week(week_of_service)
  
                    employees = Employee.all
  
                    hours_by_employee = hours_service/employees.size
  
                    schedules_by_employee = @permitted_params[:schedules].group_by{|schedule| schedule["employee_id"] }
                    
                    schedules_over_mean = schedules_by_employee.map{|data| {schedules:data[1], mean: data[1].count <= hours_by_employee}}
  
                    #find schedule over the mean
  
                    hours_over_the_mean = schedules_over_mean.find{|data| data["mean"] == true}
                    employee_schedules = []
                    
  
                    # valid schedules for hours of service
                   response = if @permitted_params[:schedules].size >= hours_service #&& hours_over_the_mean.nil?
                                   employee_schedules_ary = ApplicationController.helpers.set_schedule_by_employee(@permitted_params[:schedules],service.id,hours_service,hours_by_employee)
                                   p employee_schedules_ary 
                                   employee_schedules_ary.flatten.each do |schedule|
                                    p schedule, 'rais'
                                    
                                    employee_schedules << EmployeeSchedule.find_or_create_by(schedule)
                                  end  
                                  
                                  {message: 'Horarios agendados con exito', success: employee_schedules_ary.flatten.size == employee_schedules.size }
                              else
                                {message: 'Los horarios seleccionados no cumplen el horario a cubrir por el servicio', success:false}  
                              end  
                  else
                      {success: false, message: 'serviceId debe ser obligatario'}       
                  end  
                end 
                
             end
        end
    end    
end
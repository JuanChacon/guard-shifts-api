module EmployeeHelper

  def set_schedule_by_employee(schedules,service_id,hours_service)
      #[{employee_id:1,service_schedule_id:1}]
      # week_of_service = 04
      # hours_service =39
      hours_counter = 0
      all_employees = Employee.all.map{|e| {id: e.id,hours:0}}

      #ApplicationController.helpers.set_schedule_by_employee([{employee_id:1,service_schedule_id:1}],1,12)

      service = Service.find(service_id)
      #week_schedule_by_week = service.week_schedule_by_week(week_of_service)#.uniq{|service_schedule|service_schedule.strftime('%Y-%m-%d')} 

      service_schedules = ServiceSchedule.where(id:schedules.map{|schedule| schedule[:service_schedule_id]}.uniq)
      service_schedules_group_by_day = service_schedules.group_by{|s_s| s_s.availability_date.strftime("%d")}

      hours_by_employee = all_employees.size/service_schedules.size

      
      
      #traer dias de horarios seleccionados

      employee_schedules_array = schedules.map do |employee_schedule|
         p employee_schedule
          service_schedule= ServiceSchedule.find(employee_schedule[:service_schedule_id])
          service_schedule_datails = service_schedule.date_details
          hours_by_day = ServiceSchedule.where("DATE(availability_date) = '#{service_schedule.availability_date.strftime('%Y-%m-%d')}'").count
          p hours_by_day

          {
            day: service_schedule_datails[:dayNumber],
            employee_id: employee_schedule[:employee_id],
            employee_schedule: employee_schedule,
            hours_by_day: hours_by_day
          }

      end.group_by{|data| data[:day]}  


      employee_schedules_to_add = []

      employee_schedule_size_array = schedules.group_by{|s_e| s_e[:employee_id]}.map{|obj|  {employee_id: obj[0],schedules_size: obj[1].size}}

      

      service_schedules_group_by_day.each do |svce_schedule|
          day,data = svce_schedule # data array of hours of day
          p data
          hours_of_service = data.size
          p hours_of_service, 'HOURS'
          employee_schedule = {}
          
          if hours_of_service < hours_service
            if employee_schedule[day].nil? && employee_schedules_array[day].present?
              employees = employee_schedules_array[day].group_by{|sv_sche| sv_sche[:employee_id]}
              
              #look for first employee that match
              employee_to_add = employees.find{|e_ob| e_ob[1].size <= hours_of_service}
              
              if employee_to_add.present?
                hours_counter += employee_to_add[1].size
                all_employees.find{|e| e[:id] == employee_to_add[0]}[:hours] = employee_to_add[1].size
                employee_to_add[1].map do |ob|
                  employee_schedules_to_add << ob[:employee_schedule]
                end  
              end  

                # if emp[1].size == hours_of_service
                #   hours_counter += hours_of_service
                # end  
                
              
               
            end   
          else
            break  
          end  
          # employee_schedules_array[]
      end  


      # week_schedule_by_week.each do |schedule|
      #     day = schedule.availability_date.strftime("%d")
      #     p day
      #     p employee_schedules_array
      #     p employee_schedules_array[day], 'DATA'
      #     schedule_day_hour = employee_schedules_array[day].find{|data| data["employee_schedule"]["service_schedule_id"] == schedule.id  }

      #     if employee_schedule[day].any?
      #     end  
      # end  


    p employee_schedules_to_add
  end    
end    
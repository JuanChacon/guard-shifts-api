class ServiceSchedule < ActiveRecord::Base
    belongs_to :service


    has_many :employee_schedules
    validates_presence_of :service_id


    def schedule_hours
        "#{availability_date.strftime('%H:%M')}-#{end_date.strftime('%H:%M')}"
    end 
    
    
    def date_details

       { 
        id: id,
        dayName: I18n.t("date.day_names")[availability_date.strftime('%w').to_i],
        date: availability_date.strftime('%d/%m/%Y'),
        weekOfYear: week_of_service,
        dayNumber: availability_date.strftime("%d"),
        hour: availability_date.strftime('%H:%M'),
        day_text: availability_date.strftime('%d del %Y'),
        schedule_hours: schedule_hours 
    } 
    end

    # week of year of the availability_date
    def week_of_service
        availability_date.strftime("%W")
    end
       
end

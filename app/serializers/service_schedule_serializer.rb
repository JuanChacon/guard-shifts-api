class ServiceScheduleSerializer < ActiveModel::Serializer
    attributes :id
    attribute :date

    
    attribute :errors, if: :errors?
  
  
    def errors?
      object.errors.any?
     end

     def date 
        availability_date= object.availability_date.localtime
        p availability_date
        {
            dayName: I18n.t("date.day_names")[availability_date.strftime('%w').to_i],
            date: availability_date.strftime('%d/%m/%Y'),
            weekOfYear: availability_date.strftime("%W"),
            dayNumber: availability_date.strftime("%d"),
            hour: availability_date.localtime.strftime('%H:%M'),

        }
     end
  end
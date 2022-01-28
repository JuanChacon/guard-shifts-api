class ServiceScheduleSerializer < ActiveModel::Serializer
    attributes :id
    attribute :date

    
    attribute :errors, if: :errors?
  
  
    def errors?
      object.errors.any?
     end

     def date 
        availability_date= object.availability_date
        {
            dayName: availability_date.strftime('%A'),
            date: availability_date.strftime('%d/%m/%Y'),
            hour: availability_date.localtime.strftime('%H:%M'),

        }
     end   
  end
  
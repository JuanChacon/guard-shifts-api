# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#fake data 

if Rails.env.development?
    beginning_of_week = Date.today.beginning_of_week
    3.times do 
       Employee.create(name:Faker::Movies::StarWars.character,surname:Faker::TvShows::Friends.character)
    end
    
    2.times do 
        Service.create(name:Faker::TvShows::Simpsons.character)
    end
    service= Service.first
    

    5.times.to_a.each {|i| 
        p i 
        new_date = beginning_of_week
        new_date += i.week if i != 0

        p new_date


        ((new_date)..(new_date+5.days)).each do |date|
            #M-S
          
            #hours week
    
            hours = (19..23) if [0,6].exclude?(date.wday)
            hours = (10..23) if date.saturday?

            hours.to_a.each do |hour|
            service.service_schedules.create(availability_date:"#{date}T#{hour}:00:00",end_date:"#{date}T#{(hour+1)}:00:00")
            end 
    
    
        end
    }    

    


end
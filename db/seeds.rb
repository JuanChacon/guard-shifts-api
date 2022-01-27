# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#fake data 

if Rails.env.development?
    3.times do 
       Employee.create(name:Faker::Movies::StarWars.character,surname:Faker::TvShows::Friends.character)
    end
    
    2.times do 
        Service.create(name:Faker::TvShows::Simpsons.character)
    end


end
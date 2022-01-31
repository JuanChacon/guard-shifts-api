module API
    module Services
        class Catalogs < Grape::API
            #  format 'json'
             include API::Base
    
             resource :catalogs do
                desc 'Return 5 future weeks'
                get '/weeks' do
                   beginning_of_week = Date.today.beginning_of_week
                   dates = 5.times.to_a.map {|i| 
                    new_date = beginning_of_week
                    new_date +=  i.week if i != 0
                    
                    {
                        text: "Semana #{new_date.strftime("%W")} del #{new_date.strftime("%Y")}",
                        weekNo: new_date.strftime("%W")
                    }
                } 
                   {dates:dates}
                end
             end
        end
    end    
end
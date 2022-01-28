module API
    module Services
        class Employees < Grape::API
            #  format 'json'
             include API::Base
    
             resource :employees do
                desc 'Return all the personal'
                get '/' do
                    Employee.all
                end
             end
        end
    end    
end
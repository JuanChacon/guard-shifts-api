require "grape-swagger"
module API
  module Main
    class Root < Helpers::Base
      format :json
      default_error_formatter :json
      content_type :json, 'application/json'
      use ::WineBouncer::OAuth2
      formatter :json, Grape::Formatter::ActiveModelSerializers
    
      #  mount Projects::Services
      mount API::Services::Employees
      mount API::Services::Services
      mount API::Services::Catalogs
    
    
  
      add_swagger_documentation(
          base_path: '/',
          api_version: 'v1',
          hide_format: true, # don't show .json
          hide_documentation_path: true,
          mount_path: '/swagger_doc',
          schemes: 'http',
          endpoint_auth_wrapper: WineBouncer::OAuth2,
          info: {
              title: 'Grape Swagger base app',
              description: 'This is the base api provided by services'
          }
        )

      rescue_from :all do |e|
  
        error!({
                   error: "#{e.class} error",
                   message: e.message
               }, 401)
  
         API.respond_to_error(e)
      end
      
      #when route does not exist in request to server, the server respond with the following
      route :any, '*path' do
        error!('Unable to find endpoint',200)
      end
    end
  
  
  
  end
end
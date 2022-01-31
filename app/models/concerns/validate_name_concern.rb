module ValidateNameConcern
    extend ActiveSupport::Concern
   
    included do
          #constraints for model
          validates_presence_of :name
    end  
    
    #METHODS
    def name_to_s
      name.to_s
    end
  end
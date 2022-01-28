class TaskSerializer < ActiveModel::Serializer
    attributes :id,:name,:elapsed_time,:running,:start_time, :deleted,:project_id
    attribute :errors, if: :errors?


    def errors?
      object.errors.any?
     end

     def elapsed_time
        object.elapsed_time || 0
     end


     def deleted
        object.boolean_to_int("deleted")
     end

     def running
        object.boolean_to_int("running")
     end
end
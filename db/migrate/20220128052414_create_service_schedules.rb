class CreateServiceSchedules < ActiveRecord::Migration
  def change
    create_table :service_schedules do |t|
      t.references :service
      t.datetime :availability_date

      t.timestamps null: false
    end
  end
end

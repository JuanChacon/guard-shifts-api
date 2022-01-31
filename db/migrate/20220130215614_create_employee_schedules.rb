class CreateEmployeeSchedules < ActiveRecord::Migration
  def change
    create_table :employee_schedules do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :service_schedule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

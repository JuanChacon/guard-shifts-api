class AddEndDateToServiceSchedules < ActiveRecord::Migration
  def change
    add_column :service_schedules, :end_date, :datetime
  end
end

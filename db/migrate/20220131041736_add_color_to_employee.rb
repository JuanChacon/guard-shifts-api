class AddColorToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :color, :string
  end
end

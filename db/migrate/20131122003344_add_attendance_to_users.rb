class AddAttendanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :absences, :integer, default: 0
    add_column :users, :tardies, :integer, default: 0
    add_column :users, :excused_absences, :integer, default: 0
  end
end

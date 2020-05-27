class AddColumnsToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :start_time, :time
    add_column :meetings, :end_time, :time
  end
end

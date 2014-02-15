class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :event_id , null: false
      t.string  :date_time, null: false
      t.boolean :enabled  , null: false, default: true
      t.timestamps
    end
  end
end

class CreateMemberSchedules < ActiveRecord::Migration
  def change
    create_table :member_schedules do |t|
      t.integer :schedule_id, null: false
      t.integer :member_id  , null: false
      t.boolean :enabled    , null: false, default: false
      t.timestamps
    end
  end
end

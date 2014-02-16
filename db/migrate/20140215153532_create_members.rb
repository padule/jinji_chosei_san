class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :event_id    , null: false
      t.string  :name        , null: false
      t.string  :comment
      t.string  :access_token, null: false, limit: 10
      t.timestamps
    end
  end
end

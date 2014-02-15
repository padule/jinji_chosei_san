class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name        , null: false
      t.string :description
      t.string :access_token, null: false, limit: 10
      t.timestamps
    end
  end
end

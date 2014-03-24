class AddColumnPasswordToEvents < ActiveRecord::Migration
  def up
    add_column:events,:password,:string
    change_column:events,:password,:string,limit:32,null:false
  end
  def down
    remove_column:events,:password
  end
end

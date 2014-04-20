class AddColumnPasswordToEvents < ActiveRecord::Migration
  def up
    add_column:events,:password_digest,:string
    change_column:events,:password_digest,:string
  end
  def down
    remove_column:events,:password_digest
  end
end

class BlaBLaBla < ActiveRecord::Migration[5.1]
  def change
    remove_column :calendars, :important
    add_column :events, :important, :boolean, null: false, default: false
  end
end

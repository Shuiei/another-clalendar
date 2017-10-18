class AddPrimaryOnCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :primary, :boolean, default: false, null: false
  end
end

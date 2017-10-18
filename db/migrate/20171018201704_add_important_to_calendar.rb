class AddImportantToCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :calendars, :important, :boolean, default: false, null: false
  end
end

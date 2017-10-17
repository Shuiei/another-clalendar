class CreateGroupCalendar < ActiveRecord::Migration[5.1]
  def change
    create_table :group_calendars do |t|
      t.references :calendar
      t.references :group
    end
  end
end

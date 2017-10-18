class AddCalendarPariticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_participants do |t|
      t.references :contact
      t.references :calendar

      t.timestamps
    end
  end
end

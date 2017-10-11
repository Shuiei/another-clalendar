class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :title, null: false
      t.boolean :private, null: false, default: false
      t.belongs_to :user

      t.timestamps
    end
  end
end

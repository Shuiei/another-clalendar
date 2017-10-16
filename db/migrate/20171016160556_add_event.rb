class AddEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :start_at, null:false
      t.datetime :end_at, null: false
      t.belongs_to :calendar

      t.timestamps
    end
  end
end

class AddEventParticipant < ActiveRecord::Migration[5.1]
  def change
    create_table :event_participants do |t|
      t.references :participant
      t.references :event

      t.timestamps
    end
  end
end

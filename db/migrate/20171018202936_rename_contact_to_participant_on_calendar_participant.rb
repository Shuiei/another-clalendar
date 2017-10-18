class RenameContactToParticipantOnCalendarParticipant < ActiveRecord::Migration[5.1]
  def change
    rename_column :calendar_participants, :contact_id, :participant_id
  end
end

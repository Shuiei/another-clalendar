class EventParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :participant, foreign_key: "participant_id", class_name: "Contact"

  validates :event_id, uniqueness: { scope: :participant_id, message: 'This participant already exists' }
end

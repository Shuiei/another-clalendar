class EventParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :participant, foreign_key: "participant_id", class_name: "Contact", dependent: :destroy
end

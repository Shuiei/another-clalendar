# frozen_string_literal: true

class CalendarParticipant < ApplicationRecord
  belongs_to :calendar
  belongs_to :participant, foreign_key: "participant_id", class_name: "Contact"

  validates :calendar_id, uniqueness: { scope: :participant_id, message: "This participant already exists" }
end

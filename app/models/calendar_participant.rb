# frozen_string_literal: true

class CalendarParticipant < ApplicationRecord
  belongs_to :calendar
  belongs_to :participant, foreign_key: "participant_id", class_name: "Contact", dependent: :destroy
end

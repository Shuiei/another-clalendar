# frozen_string_literal: true

class CalendarParticipantSerializer < ActiveModel::Serializer
  attributes :id, :calendar_id, :participant_id

  belongs_to :participant
  belongs_to :calendar
end

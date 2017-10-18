# frozen_string_literal: true

class CalendarParticipantSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :participant
  belongs_to :calendar
end

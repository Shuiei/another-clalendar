# frozen_string_literal: true

class EventParticipantSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :participant_id

  belongs_to :event
  belongs_to :participant
end

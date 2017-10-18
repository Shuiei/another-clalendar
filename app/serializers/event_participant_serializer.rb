# frozen_string_literal: true

class EventParticipantSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :participant
  belongs_to :event
end

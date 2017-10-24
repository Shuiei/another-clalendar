# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at, :end_at, :important, :image

  belongs_to :calendar
  has_many :event_participants
end

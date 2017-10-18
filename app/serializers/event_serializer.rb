# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at, :end_at, :important

  belongs_to :calendar
end

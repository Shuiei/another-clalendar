# frozen_string_literal: true

class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :title, :private, :primary, :important

  belongs_to :user
  has_many :events
  has_many :participants
end

# frozen_string_literal: true

class CalendarSerializer < ActiveModel::Serializer
  attributes :title, :primary, :created_at, :image

  belongs_to :owner, class_name: 'User'
  has_many :events
  has_many :participants
end

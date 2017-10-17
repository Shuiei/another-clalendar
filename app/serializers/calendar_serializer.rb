# frozen_string_literal: true

class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :title, :private

  belongs_to :user
  has_many :events
end

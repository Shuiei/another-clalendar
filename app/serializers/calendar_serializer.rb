# frozen_string_literal: true

class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :title, :primary, :created_at, :image, :participants

  belongs_to :owner, class_name: 'User'
  has_many :events
  has_many :calendar_participants

  def participants
    object.participants.map do |a|
      ContactSerializer.new(Contact.find(a.id))
    end
  end
end

# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at, :end_at, :important, :image, :participants

  belongs_to :calendar
  has_many :event_participants

  def participants
    object.participants.map do |a|
      ContactSerializer.new(Contact.find(a.id))
    end
  end
end

# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :calendar
  has_many :participants, foreign_key: "participant_id", class_name: "EventParticipant", dependent: :destroy

  accepts_nested_attributes_for :participants, allow_destroy: true

  validates :title, :end_at, :start_at, presence: true

  class << self
    def for_invited_user(user)
      contact_ids = Contact.where(user_id: user.id).pluck(:id)
      event_ids = EventParticipant.where(participant_id: contact_ids).pluck(:event_id)

      Event.where(id: event_ids)
    end
  end
end

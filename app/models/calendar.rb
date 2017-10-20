# frozen_string_literal: true

class Calendar < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :events, dependent: :destroy
  has_many :calendar_participants, dependent: :destroy
  has_many :participants, through: :calendar_participants

  accepts_nested_attributes_for :calendar_participants, allow_destroy: true
  accepts_nested_attributes_for :events, allow_destroy: true

  validates :title, presence: true

  class << self
    def for_invited_user(user)
      contact_ids = Contact.where(user_id: user.id).pluck(:id)
      calendar_ids = CalendarParticipant.where(participant_id: contact_ids).pluck(:calendar_id)

      Calendar.where(id: calendar_ids)
    end
  end
end

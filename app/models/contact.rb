# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :user

  has_many :calendar_participant
  has_many :calendars, through: :calendar_participant

  validates :user_id, uniqueness: { scope: :owner_id, message: 'This contact already exists' }
end

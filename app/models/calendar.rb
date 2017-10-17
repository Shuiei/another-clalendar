# frozen_string_literal: true

class Calendar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :group_calendars, dependent: :destroy

  validates :title, presence: true
end

# frozen_string_literal: true

class GroupCalendar < ApplicationRecord
  has_one :calendar
  has_one :group

  validates :group_id, uniqueness: { scope: :calendar_id }
end

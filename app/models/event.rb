# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :calendar

  validates :title, :end_at, :start_at, presence: true
end

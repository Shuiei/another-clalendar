# frozen_string_literal: true

class Calendar < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :title, presence: true
end

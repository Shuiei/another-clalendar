# frozen_string_literal: true

class Calendar < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
end

# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :contacts
  has_many :group_calendars, dependent: :destroy
end

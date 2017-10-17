# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :user
  has_and_belongs_to_many :groups, dependent: :destroy

  validates :user_id, uniqueness: { scope: :owner_id, message: 'This contact already exists' }
end

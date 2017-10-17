# frozen_string_literal: true

class ContactSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :owner, class_name: 'User'
  belongs_to :user

  has_many :groups
end

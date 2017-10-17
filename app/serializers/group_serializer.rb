# frozen_string_literal: true

class GroupSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :owner, class_name: 'User'
  has_many :contacts
end

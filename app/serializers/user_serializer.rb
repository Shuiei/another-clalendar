# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :nickname, :image

  has_many :calendars
  has_many :contacts
  has_many :groups
end

# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image, :name, :nickname, :created_at

  has_many :calendars
  has_many :contacts
end

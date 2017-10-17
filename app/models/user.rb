# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :calendars, dependent: :destroy
  has_many :contacts, foreign_key: 'owner_id', dependent: :destroy
  has_many :groups, foreign_key: 'owner_id', dependent: :destroy
end

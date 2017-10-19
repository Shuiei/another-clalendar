# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  after_create :create_calendar

  include DeviseTokenAuth::Concerns::User

  has_many :calendars, dependent: :destroy, foreign_key: 'owner_id'
  has_many :contacts, foreign_key: 'owner_id', dependent: :destroy

  private

  def create_calendar
    calendars.create(title: 'MyCalendar', primary: true)
  end
end

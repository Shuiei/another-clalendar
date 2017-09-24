# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :calendars
end

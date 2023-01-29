# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  validates :line1, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
end

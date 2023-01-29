# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :coffee_shops
  has_one :address

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true

  before_create :normalize_attributes

  after_create do
    if Rails.env.production?
      user = {
        type: :user,
        event: :create,
        id: id,
        first_name: first_name,
        last_name: last_name,
        username: username,
        email: email,
        zipcode: zipcode
      }
      LogCreateJob.perform_later(user)
    end
  end

  def find_favorite(coffee_shop)
    return false if coffee_shops.empty?

    coffee_shops.find_by_name(coffee_shop.name).present?
  end

  has_secure_password

  def self.from_omniauth(params)
    find_or_create_by(uid: params[:uid], provider: params[:provider]) do |user|
      user.first_name = params[:info][:first_name]
      user.last_name = params[:info][:last_name]
      user.username = params[:info][:name]
      user.email = params[:info][:email]
      user.password = SecureRandom.hex(15)
    end
  end

  def normalize_attributes
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
    self.email = email.downcase
  end
end

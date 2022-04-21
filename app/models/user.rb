class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates :email, presence: true, uniqueness: true
	validates :zipcode, presence: true

	before_create :normalize_attributes

	has_secure_password

	def normalize_attributes
		self.first_name = self.first_name.titleize
		self.last_name = self.last_name.titleize
		self.email = self.email.downcase
	end
end

class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates :email, presence: true, uniqueness: true
	validates :zipcode, presence: true

	before_create :normalize_attributes

	after_create do
		if Rails.env.development?
			user = {
				type: :user,
				event: :create,
				first_name: self.first_name,
				last_name: self.last_name,
				username: self.username,
				email: self.email,
				zipcode: self.zipcode
			}
			LogCreateJob.perform_later(user)
		end
	end

	has_secure_password

	def normalize_attributes
		self.first_name = self.first_name.titleize
		self.last_name = self.last_name.titleize
		self.email = self.email.downcase
	end
end

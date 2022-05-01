class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates :email, presence: true, uniqueness: true

	before_create :normalize_attributes

	after_create do
		if Rails.env.production?
			user = {
				type: :user,
				event: :create,
				id: self.id,
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
		self.first_name = self.first_name.titleize
		self.last_name = self.last_name.titleize
		self.email = self.email.downcase
	end
end

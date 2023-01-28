# frozen_string_literal: true

module Helpers
	def log_in(user)
		visit log_in_path
		fill_in :email, with: user.email
		fill_in :password, with: user.password
		within("#sign_in") do
			click_button "Sign In"
		end
	end
end

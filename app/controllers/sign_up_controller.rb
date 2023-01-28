# frozen_string_literal: true

class SignUpController < ApplicationController
	def new; end

	def create
		user = User.new(user_params)

		if user.save
			session[:user_id] = user.id
			flash[:notice] = "Welcome to Caffeination #{user.username}!"
			redirect_to root_path
		else
			flash[:error] = "#{user.errors.full_messages}"
			redirect_to sign_up_path
		end
	end

	private

	def user_params
		params.permit(:username,:password,:first_name,:last_name,:address_1,:address_2,:city,:state,:zipcode,:email,:favorite_beverage)
	end
end

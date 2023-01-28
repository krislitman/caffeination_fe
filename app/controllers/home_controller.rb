# frozen_string_literal: true

class HomeController < ApplicationController
	def index
		@current_location = params[:current_location] rescue nil
		@favorite_spots = FindService.find_favorite_spots(current_user.email) rescue nil
	end
end

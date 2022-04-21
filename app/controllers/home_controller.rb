class HomeController < ApplicationController
	def index
		@current_location = params[:current_location] || nil
	end
end

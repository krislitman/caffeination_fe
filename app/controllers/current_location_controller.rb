# frozen_string_literal: true

class CurrentLocationController < ApplicationController
	def find
		location = CurrentLocationService.abstract_location || "Could not find current location"

		redirect_to root_path(current_location: location)
	end
end

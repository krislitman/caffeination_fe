class CurrentLocationController < ApplicationController
	def find
		location = CurrentLocationService.get_current_location || "Could not find current location"
		redirect_to root_path(current_location: location)
	end
end

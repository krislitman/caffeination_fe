class CurrentLocationController < ApplicationController
  def find
    location = CurrentLocationService.get_current_location

    if location.nil?
      # Add error handling
    else
      redirect_to root_path(current_location: location)
    end
  end
end

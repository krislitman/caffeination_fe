class SearchController < ApplicationController
  def index
    begin
      if found = YelpPoro.find(zipcode)
        @coffee_shops = found
      else
        @coffee_shops = YelpService.search(search_params)
      end
    rescue
      flash[:notice] = "An unexpected error occurred"
      # Log error
      redirect_to root_path
    end
  end

  private

  def search_params
    params.permit(:query)
  end
end

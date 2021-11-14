class SearchController < ApplicationController
  def index
    begin
      @coffee_shops = YelpService.search(search_params)
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

# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :location, only: [:index]

  def index
    @pagy, @coffee_shops = pagy_array(SearchFacade.route(location))
  rescue StandardError
    redirect_to root_path(current_location: 'Please try a different location!')
  end

  private

  def location
    if params[:query]
      session[:location] = params[:query]
    else
      session[:location]
    end
  end

  def search_params
    params.permit(:query, :sort_by, :price, :button)
  end
end

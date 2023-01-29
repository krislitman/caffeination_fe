# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @current_location = begin
      params[:current_location]
    rescue StandardError
      nil
    end
    @favorite_spots = begin
      FindService.find_favorite_spots(current_user.email)
    rescue StandardError
      nil
    end
  end
end

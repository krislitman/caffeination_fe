# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: [:edit]

  def edit
    @current_user = current_user
    @address = current_user.address
  end

  def update
    user = User.find params[:id]
    address = user.address

    user.update(user_params)
    address.update(address_params)

    if user.save && address.save
      flash[:notice] = 'Settings updated successfully'
    else
      flash[:error] = 'An unexpected error occurred, please try again'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :favorite_beverage)
  end

  def address_params
    params.require(:user).permit(:line1, :line2, :city, :state, :postal_code, :country)
  end
end

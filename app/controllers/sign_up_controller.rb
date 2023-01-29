# frozen_string_literal: true

class SignUpController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      address = Address.new(address_params)
      address.user_id = user.id

      if address.save
        flash[:notice] = "Welcome to Caffeination #{user.username}!"
        redirect_to root_path
      else
        flash[:error] = address.errors.full_messages.to_s
        redirect_to sign_up_path
      end
    else
      flash[:error] = user.errors.full_messages.to_s
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.permit(:username, :password, :first_name, :last_name, :email, :favorite_beverage)
  end

  def address_params
    params.permit(:line1, :line2, :city, :state, :postal_code, :country)
  end
end

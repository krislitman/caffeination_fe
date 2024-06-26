# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: normalized_email)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:message] = "Welcome back #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Couldn't log you in :("
      redirect_to log_in_path
    end
  end

  def edit
    @current_user = current_user
    @address = current_user.address
  end

  def update; end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])

    if user
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Couldn't log you in :("
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = 'You have been logged out'

    redirect_to root_path
  end

  private

  def normalized_email
    params[:email].downcase
  end
end

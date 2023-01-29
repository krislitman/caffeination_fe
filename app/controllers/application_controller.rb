# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception
  helper_method :current_user, :authorized, :logged_in

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized
    redirect_to login_path if logged_in == false
  end

  def logged_in
    !!current_user
  end

  def unexpected_error
    flash[:notice] = 'An unexpected error occurred'
    # Log error
    redirect_to root_path
  end
end

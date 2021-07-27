# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_authenticated?

  def current_user
    Administrator.find session[:administrator_id] if session[:administrator_id]
  end

  def user_authenticated?
    !current_user.nil?
  end

  def validate_url
    return redirect_to login_path unless user_authenticated?
  end
end

# frozen_string_literal: true

require 'will_paginate/array'

class ApplicationController < ActionController::Base
  before_action :require_login, except: %i[forgot reset passedit]
  helper_method :current_user
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || new_customer_path)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:userid])
  end

  def require_login
    return if session[:current]

    redirect_to login_path unless request.fullpath == login_path
  end
end

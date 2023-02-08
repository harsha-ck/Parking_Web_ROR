class ApplicationController < ActionController::Base
before_action :require_login

  private

  def require_login
    unless session[:current]
      flash[:error] = "You must be logged in to access this page"
      redirect_to login_path unless request.fullpath == login_path
    end

  end

def restrict_access
  if session[:current] == "user"
    flash[:alert] ="Access Denied"
    redirect_to new_customer_path
    end
  end
end


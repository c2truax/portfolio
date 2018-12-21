class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def project_load
    Project.all
  end
  helper_method :project_load

  private
  def require_login
    if !current_user
      redirect_to "/projects"
    end
  end
end

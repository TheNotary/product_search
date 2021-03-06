class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admins_only
    unless current_user.try(:admin?)
      redirect_to '/', :alert => "Access denied."
    end
  end

end

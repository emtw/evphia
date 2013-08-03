class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end  
  
  def current_ability
    if current_user && current_user.user?
      @current_ability ||= Ability.new(current_user)
    elsif current_keyholder && current_keyholder.keyholder?
      @current_ability ||= Ability.new(current_keyholder)
    else
      
    end
  end
  
end

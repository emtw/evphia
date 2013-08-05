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
    elsif current_guest && current_guest.guest?
      @current_ability ||= Ability.new(current_guest)
    else
      
    end
  end
  
   protected
  
  
  def authorize
    @user = User.find(params[:id])
      unless @user.id==current_user.id
        redirect_to root_url, notice: "Please log in to view this account."
      end
  end
  
  def authorize_keyholder
    if user_signed_in?
      url_for :controller => "/users", :id => current_user.id, :action => 'myaccount'
    else
    @keyholder = Keyholder.find(params[:id])
      unless @keyholder.id==current_keyholder.id
        redirect_to root_url, notice: "Please log in to view this account."
      end
    end
  end
  
  def authorize_guest
    if user_signed_in?
      url_for :controller => "/users", :id => current_user.id, :action => 'myaccount'
    elsif keyholder_signed_in?
      url_for :controller => "/keyholders", :id => current_keyholder.id, :action => 'myaccount'
    else
    @guest = Guest.find(params[:id])
      unless @guest.id==current_guest.id
        redirect_to root_url, notice: "Please log in to view this account."
      end
    end
  end
  
  def after_sign_up_path_for(resource)
    url_for :controller => "/#{resource_name}s", :id => resource.id, :action => 'myaccount'
  end
  
  def after_sign_in_path_for(resource)
    url_for :controller => "/#{resource_name}s", :id => resource.id, :action => 'myaccount'
  end    
  
  def after_update_path_for(resource)
    url_for :controller => "/#{resource_name}s", :id => resource.id, :action => 'myaccount'
  end
  
  
end

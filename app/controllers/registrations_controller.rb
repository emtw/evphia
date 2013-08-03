class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end
  
  # POST /resource
  def create
    
    if current_user!=nil
      @user = current_user
      build_resource(sign_up_params)
      resource.user_id = @user.id
      
      if @user.keyholder_id.nil? && resource.keyholder
        if resource.save
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_up(resource_name, resource)
            @user.keyholder_id = resource.id
            @user.save
            sign_out(resource)
            flash[:notice] = "You have successfully added a keyholder to your account"  
            respond_with resource, :location => after_sign_up_path_for(resource)
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          respond_with resource
        end
       elsif @user.keyholder_id
        flash[:notice] = 'You have already created a keyholder for your account.'
        redirect_to current_user
      end
      
      elsif @user.guest_id.nil? && resource.guest
        if resource.save
            if resource.active_for_authentication?
              set_flash_message :notice, :signed_up if is_navigational_format?
              sign_up(resource_name, resource)
              @user.guest_id = resource.id
              @user.save
              sign_out(resource)
              flash[:notice] = "You have successfully added a guest to your account"  
              respond_with resource, :location => after_sign_up_path_for(resource)
            else
              set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
              expire_session_data_after_sign_in!
              respond_with resource, :location => after_inactive_sign_up_path_for(resource)
            end
          else
            clean_up_passwords resource
            respond_with resource
          end
         elsif @user.guest_id
          flash[:notice] = 'You have already created a guest for your account.'
          redirect_to current_user
        end  
        
    if current_keyholder!=nil
        @key = current_keyholder
        build_resource(sign_up_params)
        resource.user_id = @key.user.id
        
        if @key.guest_id.nil?
          if resource.save
            if resource.active_for_authentication?
              set_flash_message :notice, :signed_up if is_navigational_format?
              sign_up(resource_name, resource)
              @key.user.guest_id = resource.id
              @key.user.save
              sign_out(resource)
              flash[:notice] = "You have successfully added a guest to the account"  
              respond_with resource, :location => after_sign_up_path_for(resource)
            else
              set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
              expire_session_data_after_sign_in!
              respond_with resource, :location => after_inactive_sign_up_path_for(resource)
            end
          else
            clean_up_passwords resource
            respond_with resource
          end
         elsif @key.user.guest_id
          flash[:notice] = 'There is already a guest for this account.'
          redirect_to current_keyholder
        end
      end
    
  end
  
  def update
    super
  end

end

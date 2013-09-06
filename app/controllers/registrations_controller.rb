class RegistrationsController < Devise::RegistrationsController

  # update the users details
  def update
    @user = User.find(current_user.id)
    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.for(:account_update))
    else
      update_selected_attributes(params, @user)
    end
    
    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end


private
  
  # update only certain user attributes without exposure to mass assignment attack
  # (unlike the devise sanitizer no current password is required)
  def update_selected_attributes(params, user)
      name = params[:user][:name]
      password = params[:user][:password]
      password_confirmation = params[:user][:password_confirmation]

      user.name = name unless name.blank?
      user.password = password unless password.blank?
      user.password_confirmation = password_confirmation unless password_confirmation.blank?
      user.save
  end

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email]
  end
end
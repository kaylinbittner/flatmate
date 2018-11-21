class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :photo)
  end

  # def update_resource(resource, params)
  #   # Require current password if user is trying to change password.
  #   return super if params["password"]&.present?

  #   # Allows user to update registration information without password.
  #   resource.update_without_password(params.except("current_password"))
  # end
end

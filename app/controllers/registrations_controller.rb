class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:roles, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:roles, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
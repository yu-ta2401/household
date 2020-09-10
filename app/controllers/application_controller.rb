class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birthday])
  end
end

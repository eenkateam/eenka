class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana, :last_kana, :postal_code, :phone_number, :email, :adress])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_kana, :last_kana, :postal_code, :phone_number, :email])
  end
end

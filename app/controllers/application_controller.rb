class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_give

  def search_give
  	@q = Product.ransack(params[:q])
  end


  private
  def after_sign_in_path_for(resource)
  case resource
  when User
    root_path
  when Admin
    admin_products_path
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana, :last_kana, :postal_code, :phone_number, :email, :adress])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :first_kana, :last_kana, :postal_code, :phone_number, :email, :adress])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_kana, :last_kana, :postal_code, :phone_number, :email, :adress])
  end
end

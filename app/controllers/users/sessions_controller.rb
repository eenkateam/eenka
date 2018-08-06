# frozen_string_literal: true
require 'yaml'
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
     super
  end

  # POST /resource/sign_in
  def create
    if admin_signed_in?
      redirect_to new_user_session_path,alert: "管理者からログアウトしてください"
    else
      if User.find_by(email: params[:user][:email])
        if User.find_by(email: params[:user][:email]).flag != 1
            super
        else
          redirect_to new_user_session_path
        end
      else
        super
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if params[:flag] == "1"
      current_user.flag = 1
      current_user.save
    end
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

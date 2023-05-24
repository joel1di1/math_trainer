# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    def create
      if params[:user][:uuid].present?
        user = User.find_by(uuid: params[:user][:uuid])
        if user.blank?
          user = User.create!(uuid: params[:user][:uuid], email: "#{params[:user][:uuid]}@example.com",
                              password: SecureRandom.hex)
        end
        sign_in(resource_name, user)
        redirect_to root_path
        return
      end

      super
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def user
        return User.find_by(id: self.user_id)
    end 

    protected
    def configure_permitted_parameters
        added_attrs = [ :email, :password, :password_confirmation　]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end

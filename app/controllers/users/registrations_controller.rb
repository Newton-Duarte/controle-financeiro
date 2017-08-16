class Users::RegistrationsController < Devise::RegistrationsController

 before_filter :configure_permitted_parameters

 def new
  build_resource({})
  resource.build_user_profile
  respond_with self.resource
 end

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(
    :sign_up,
    keys: [
      :email, :password, :password_confirmation,
      :user_profile_attributes => [:first_name, :last_name]
    ]
  )
 end

end

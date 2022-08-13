class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[name email password]
  end

  def authenticate_user!
    redirect_to splash_path unless user_signed_in?
  end
end

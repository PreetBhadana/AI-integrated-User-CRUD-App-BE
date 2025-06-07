class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  # Override Devise redirect methods to prevent redirects in API
  def after_sign_in_path_for(resource)
    nil
  end

  def after_sign_out_path_for(resource_or_scope)
    nil
  end
end
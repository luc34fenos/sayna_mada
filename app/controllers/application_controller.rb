class ApplicationController < ActionController::Base
  require 'dotenv'
  Dotenv.load

  before_action :configure_permitted_parameters, if: :devise_controller?
  if controller_name == "vitrines"
    before_action :authenticate_user!
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end

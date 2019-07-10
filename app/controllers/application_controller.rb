class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private
    def formulaire
      if user_signed_in?
        if Entreprise.find_by(user_id: current_user.id)
          redirect_to company_1_path
        end
      end
    end

end

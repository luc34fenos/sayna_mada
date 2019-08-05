# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit]

  # GET /resource/sign_up
  def new
    if user_signed_in?
      flash[:alert] = "Vous etes déjà connecté"
      redirect_to home_path
    end
    build_resource
    yield resource if block_given?
    respond_with resource

  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.persisted?
        create_student_or_company(resource)
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      flash[:alert] = "L'email ou pseudo a déjà été utilisé, veuillez en choisir un autre"
      redirect_to new_user_registration_path
    end
  end

  # GET /resource/edit
  def edit
    render :edit
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end

  protected

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end

  # By default we want to require a password checks on update.
  # You can overwrite this method in your own RegistrationsController.
  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    scope = Devise::Mapping.find_scope!(resource)
    router_name = Devise.mappings[scope].router_name
    context = router_name ? send(router_name) : self
    context.respond_to?(:root_path) ? context.root_path : "/"
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    sign_in_after_change_password? ? signed_in_root_path(resource) : new_session_path(resource_name)
  end

  # Authenticates the current scope and gets the current resource from the session.
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", force: true)
    self.resource = send(:"current_#{resource_name}")
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  def translation_scope
    'devise.registrations'
  end

  private

  def set_flash_message_for_update(resource, prev_unconfirmed_email)
    return unless is_flashing_format?

    flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                  :update_needs_confirmation
                elsif sign_in_after_change_password?
                  :updated
                else
                  :updated_but_not_signed_in
                end
    set_flash_message :notice, flash_key
  end

  def sign_in_after_change_password?
    return true if account_update_params[:password].blank?

    Devise.sign_in_after_change_password
  end

  def create_student_or_company(resource)
    if !params[:student].nil?
      p "S"*50
      @student = Student.new(student_params)
      @student.user = resource
      create_city(@student)
      create_cv(@student)
      resource.update(status: "student")
      unless @student.save
        resource.destroy
      end
      p "S"*50
    elsif !params[:company].nil?
      p "C"*50
      c = Company.new(company_params)
       	c.user = resource
        resource.update(status: "company")
       	c.cities = []
       	create_company_city(c)
       	c.staff = []
       	c.webs = []
      unless c.save
        resource.destroy
      end
      p "C"*50
    end
  end

  def create_cv(student)
    @cv = Cv.create(cv_params)
    create_cover_letter(@cv)
    student.cv = @cv
  end

  def create_cover_letter(cv)
    cl = CoverLetter.create(cv: @cv, content: "<p align=\"left\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{@student.firstname} #{@student.lastname}</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{@student.address}</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{@student.tel}</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{@student.user.email}</span></p><br style=\"color: rgb(51, 51, 51);\"><p align=\"right\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Nom de l\'entreprise]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Nom/prénom/poste du destinataire]</span><br><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Adresse de l\'entreprise]</span>&nbsp;<br></p><p align=\"right\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{@student.city.name}</span>, le&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{Time.now.strftime("%d %B %Y")}</span></p><br style=\"color: rgb(51, 51, 51);\"><p class=\"weight-bold\" style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><b>Objet</b><span style=\"font-weight: 700;\"> : Candidature au poste de&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[nom du poste auquel tu postules]</span></span></p><br style=\"color: rgb(51, 51, 51);\"><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Madame, Monsieur,</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Par le biais de la présente et du CV ci-joint, je souhaite vous soumettre mon profil et vous exprimer toute ma motivation pour exercer les fonctions de&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[emploi pour lequel tu postules]</span>&nbsp;au sein de votre service de&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[service pour lequel tu postules]</span>.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Lors de mes dernières expériences professionnelles, j’ai travaillé pour différentes entreprises du secteur&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[secteur ou secteurs dans lesquels tu as travaillé]</span>, où j’ai pu acquérir et développer de solides connaissances en&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[mentionne les programmes ou les domaines dans lesquels tu as acquis des connaissances]</span>, entre autres, que j’aimerais partager avec vous et continuer à approfondir au sein d’une équipe dynamique et stimulante.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Au cours de ma dernière expérience professionnelle à/chez&nbsp;<span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[dernière entreprise dans laquelle tu as travaillé]</span>, j’ai également eu l’occasion de contribuer au développement de différents projets, raison pour laquelle le fait de continuer à travailler au lancement de nouvelles idées et d’apprendre aux côtés d’une nouvelle équipe me motive énormément.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">Je serai ravi(e) de vous rencontrer à l’avenir pour pouvoir parler de votre entreprise et de la mission proposée.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\">En vous remerciant pour le temps que vous aurez bien voulu accorder à ma lettre, je vous prie de bien vouloir agréer, madame, monsieur, mes plus cordiales salutations.</p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">#{@student.firstname} #{@student.lastname}</span></p><p style=\"border: 0px; padding: 0px; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; text-align: justify; color: rgb(51, 51, 51);\"><span class=\"txt-toreplace\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(3, 0, 198);\">[Ta signature]</span></p>")
  end

  def create_city(student)
    c = City.find_by(name: params[:city]) != nil ? City.find_by(name: params[:city]) : City.create(name:params[:city], country: params[:country])
    student.city = c
  end

  def create_company_city(company)
    c = City.find_by(name: params[:city]) != nil ? City.find_by(name: params[:city]) : City.create(name:params[:city], country: params[:country])
  	company.cities << c
  end

  def student_params
    params.require(:student).permit(:tel, :lastname, :firstname, :birthdate, :address, :sexe, :marital_status)
  end
  def company_params
    params.require(:company).permit(:name,  :tel, :start_date, :address, :legal_status, :phone, :activity_area , :siret, :other)
  end
  def cv_params
    params.require(:cv).permit(:hobbies, :summary)
  end

end

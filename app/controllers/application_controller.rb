class ApplicationController < ActionController::Base

  Refile.secret_key = '81b01a25499d4f4fcb887ec880a4f55d88c2d16b9c658cda758940a8297610f71d095af050f4de004e1b3aa14753495be9af52ad98e8c6c0c971680758505d25'
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :encrypted_password, :name, :profile, :occupation, :position])
  end
end

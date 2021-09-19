class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  Refile.secret_key = '81b01a25499d4f4fcb887ec880a4f55d88c2d16b9c658cda758940a8297610f71d095af050f4de004e1b3aa14753495be9af52ad98e8c6c0c971680758505d25'
  protect_from_forgery with: :null_session

  protected

  # def basic_auth
  #   authenticate_or_request_with_http_basic do [name, password]
  #   name == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :encrypted_password, :name, :profile, :occupation, :position, :agreement])
  end
end

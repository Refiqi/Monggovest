# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Include Knock within your application.

  include Knock::Authenticable
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
  before_action :skip_session

  def current_user
    if token
      @_current_user ||= begin
        Knock::AuthToken.new(token: token).entity_for(User)
                         rescue StandardError
                           nil
      end
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[name email password password_confirmation role])
  end

  private

  def skip_session
    request.session_options[:skip] = true if token
  end

  def authenticate_entity(entity_name)
    if token
      super(entity_name)
    else
      current_user
    end
  end
end

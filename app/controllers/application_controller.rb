# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # Include Knock within your application.

  include Knock::Authenticable
end

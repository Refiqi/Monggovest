
class Api::V1::HomeController < ApplicationController
  before_action :authenticate_user, only: [:auth]

  # Public method
  def index
    render json: { service: 'auth-api', status: 200 }
  end

  # Authorized only method
  # def auth
  #   if authenticate_user true
  #     render json: { status: 200, msg: "You are currently Logged-in as #{current_user.name}" }
  #   else
  #     not_auth
  #  end
  # end

  # private

  # def not_auth
  #   render json: {
  #     message: 'Unauthorized Access',
  #     result: 'No Token Detected',
  #     status: 'Unauthorized'
  #   }, status: 401
  # end
end

class Api::V1::HomeController < ApplicationController
  before_action :authenticate_user, only: %i[auth all]

  # Public methodz
  def index
    render json: { service: 'auth-api', status: 200 }
  end

  # Show all users
  def all
    user = User.all
    render json: user, status: :ok
  end

  # Authorized only method
  def auth
    if authenticate_user true
      render json: { status: 200,
                     msg: "You are currently Logged-in
                          as #{current_user.name}" }
    else
      not_auth
    end
  end

  private

  def not_auth
    render json: {
      message: 'Unauthorized Access',
      result: 'No Token Detected',
      status: 'Unauthorized'
    }, status: :unauthorized
  end
end

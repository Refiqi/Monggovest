# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  # Use Knock to make sure the current_user is authenticated before completing request.
  # before_action :authenticate_user,  only: [:index, :current, :update]
  before_action :authorize_as_admin, only: [:destroy]
  # before_action :authorize,          only: [:update]

  # Should work if the current_user is authenticated.
  def index
    if current_user
      render json: { status: 200, msg: 'Logged-in' }
    else
      not_auth
    end
  end

  # Call this method to check if the user is logged-in.
  # If the user is logged-in we will return the user's information.
  def current
    if current_user
      current_user.update!(last_login: Time.now)
      render json: current_user
    else
      not_auth
    end
  end

  # Method to create a new user using the safe params we setup.
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 'OK', msg: 'User was created.', error: 'nil' }
    else
      not_good(406)
    end
  end

  # Method to update a specific user. User will need to be authorized.
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { status: 'OK', msg: 'User details have been updated.', error: 'nil' }
    else
      not_good(406)
    end
  end

  # Method to delete a user, this method is only for admin accounts.
  def destroy
    user = User.find(params[:id])
    if current_user.role == 'admin'
      user.destroy
      render json: { status: 200, msg: 'User has been deleted.' }
    else
      not_auth
    end
  end

  private

  # Setting up strict parameters for when we add account creation.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

  # Adding a method to check if current_user can update itself.
  # This uses our UserModel method.
  def authorize
    return_unauthorized unless current_user&.can_modify_user?(params[:id])
  end

  def not_auth(status = :unauthorized)
    render json: {
      result: 'Error',
      message: 'Unauthorized Access',
      status: 'Unauthorized'
    }, status: status
  end

  def not_good(status = 406)
    render json: {
      result: 'Unfilled params',
      message: 'Please Fill the Correct params',
      status: 'Not_acceptable'
    }, status: status
  end
end

# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  # Should work if the current_user is authenticated.
  def index
    if current_user
      render json: { status: 200, msg: "Logged-in as #{current_user.name}" }
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
      render json: { status: 'OK', msg: 'User was created.', error: 'nil' }, status: 201
    else
      not_good(422)
    end
  end

  # Method to update a specific user. User will need to be authorized.
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {
        status: 'OK',
        msg: 'User details have been updated.',
        error: 'nil'
      }, status: 202
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

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
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

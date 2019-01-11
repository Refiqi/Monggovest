# frozen_string_literal: true

class Api::V1::PasswordsController < ApplicationController
  def forgot
    # Check email ada atau tidak
    return render json: { error: 'Email not present' } if params[:email].blank?

    # Jika Email ada
    @user = User.find_by(email: params[:email])
    if @user.present?
      @user.generate_password_token! # generate pass token
      token = @user.reset_password_token
      @url =
        "https://monggovest-staging.herokuapp.com/password/reset=#{token}"
      UserMailer.reset_password(@user, @url).deliver_now
      render json: { status: 'ok' }, status: :ok
    else
      render json: { error: ['Email address not found.
                    Please check and try again.'] }, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s
    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: { status: 'ok' }, status: :ok
      else
        render json: { error: user.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { error: ['Link not valid or expired.
                    Try generating a new link.'] },
             status: :not_found
    end
  end
end

# frozen_string_literal: true

class Api::V1::PasswordsController < ApplicationController
  
# Method for Generating Token for Reseting Password.  
  
  def forgot
    # Check if Email present or not.
    return render json: { error: 'Email not present' } if params[:email].blank?

    # If There's an Email then 
    @user = User.find_by(email: params[:email])
    if @user.present?
      # Generate pass token
      @user.generate_password_token!
      token = @user.reset_password_token
      @url =
        "https://monggovest-staging.herokuapp.com/password/reset=#{token}"
      # Sending Email with Mailer
      UserMailer.reset_password(@user, @url).deliver_now
      render json: { status: 'ok' }, status: :ok
    # If Email is not present.  
    else
      render json: { error: ['Email address not found.
                    Please check and try again.'] }, status: :not_found
    end
  end

# Method to Change Password

  def reset

    # It Will try to Find the token that match in database.
    token = params[:token].to_s
    user = User.find_by(reset_password_token: token)

    # If it return true then it will call reset_password Method in Model User.
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: { status: 'ok' }, status: :ok
      else
        render json: { error: user.errors.full_messages },
               status: :unprocessable_entity
      end

    # If the Token is invalid or Expired then it will throw this callback
    
    else
      render json: { error: ['Link not valid or expired.
                    Try generating a new link.'] },
             status: :not_found
    end
  end
end
